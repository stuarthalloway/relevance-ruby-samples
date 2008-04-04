require 'test/unit/ui/console/testrunner'

class TurnHelper
  
  def self.running_in_textmate?
    Object.const_defined?("TextMate")
  end
  
  def self.running_in_cruise?
    !ENV['CC_BUILD_ARTIFACTS'].nil?  
  end
  
  # Needed for facets < 2.0
  def self.require_ansicode_for_old_facets
    require 'facets/more/ansicode'
  end
  
  # Facets >= 2.0
  def self.require_ansicode_for_new_facets
    require 'facets/ansicode'
  end
  
  def self.require_ansicode_unless_cc
    unless running_in_cruise?
      begin
        require_ansicode_for_old_facets
      rescue LoadError
        begin
          require_ansicode_for_new_facets
        rescue LoadError
          STDERR.puts "Can't load ansicode - test coloring will not work!"
        end
      end
    end
    # require 'facets/more/ansicode' unless running_in_cruise?
  end
end

# Textmate has its own coloring, so we only want to use Turn if we aren't in textmate
unless TurnHelper.running_in_textmate?
  
  begin
    TurnHelper.require_ansicode_unless_cc
  rescue LoadError
    begin
      require 'rubygems'
      TurnHelper.require_ansicode_unless_cc
    rescue LoadError
    end
  end


  module ::Test::Unit
  module UI
  module Console
    class TestRunner

      alias :t_attach_to_mediator :attach_to_mediator
      def attach_to_mediator
        @mediator.add_listener(TestRunnerMediator::STARTED, &method(:t_started))
        @mediator.add_listener(TestRunnerMediator::FINISHED, &method(:t_finished))
        @mediator.add_listener(TestCase::STARTED, &method(:t_test_started))
        @mediator.add_listener(TestCase::FINISHED, &method(:t_test_finished))
        @mediator.add_listener(TestResult::FAULT, &method(:t_fault))
        @io.sync = true
        @t_cur_file, @t_fault = nil
      end

      def t_started( result )
        @t_result = result
      end

      def t_finished( elapsed_time )
        failure = @t_result.failure_count
        error   = @t_result.error_count
        total   = @t_result.run_count
        pass = total - failure - error

        bar = '=' * 78
        if COLORIZE
          bar = if pass == total then ::Console::ANSICode.green bar
                else ::Console::ANSICode.red bar end
        end

        @io.puts
        @io.puts bar
        @io.puts "  pass: %d,  fail: %d,  error: %d" % [pass, failure, error]
        @io.puts "  total: %d tests with %d assertions in #{elapsed_time} seconds" % [total, @t_result.assertion_count]
        @io.puts bar
      end

      def t_test_started( name )
        method, file = name.scan(%r/^([^\(]+)\(([^\)]+)\)/o).flatten!
        if @t_cur_file != file
          @t_cur_file = file
        end
        @test_unformatted = method
        @test = "    %-69s" % "- #{method.gsub('test_','').humanize}"
      end

      def t_test_finished( name )
        @io.print PASS unless @t_fault
        @t_fault = false
      end

      def t_fault(fault)
        @t_fault = true
        msg  = "\n#{@t_cur_file}:#{@test} - "
      
        case fault
        when ::Test::Unit::Error
          msg << ERROR << "\n"
          msg << fault.to_s.split("\n")[2..-2].join("\n\t")
          backtrace = fault.exception.backtrace
        when ::Test::Unit::Failure
          msg << FAIL << "\n"
          msg << fault.message.gsub(%r/#.([\w?]+)/,'Failed :\1(...) expectation').gsub("\n","\n\t")
          backtrace = fault.location
        end

        msg << "\n"
        msg << technicolor_textmate_url(*fault_to_file_and_line(backtrace))

        msg = ::Console::ANSICode.magenta msg if COLORIZE
        @io.puts msg
      end
    
      # TODO need to escape regex special characters in the test name
      def fault_to_file_and_line(backtrace)
        escaped_test_name = Regexp.escape(@test_unformatted) rescue '' # could we not have the test name ?
        matching_backtrace = backtrace.grep(/in `#{escaped_test_name}'/)
        backtrace = matching_backtrace unless matching_backtrace.empty?
        backtrace.each do |line|
           line =~ /(.*\.rb):(\d*)/
           return [$1.strip, $2] unless $1.blank?
         end
      end

      def technicolor_textmate_url(*args)
        return (::Console::ANSICode.blue textmate_url(*args)) if COLORIZE
        "open me => #{textmate_url(*args)}"
      end

      def textmate_url(file, line)
        return "txmt://open?url=file://#{File.expand_path(file)}#{textmate_line_number(line)}" if file[0] == "/"[0]
        "txmt://open?url=file://#{full_path(file)}#{textmate_line_number(line)}"
      end
    
      def full_path(file)
        File.expand_path "#{base_path}/#{file}"
      end
    
      def textmate_line_number(line)
        "&line=#{line}" unless line.nil?
      end
    
      def base_path
        Object.const_defined?('RAILS_ROOT') ? RAILS_ROOT : `pwd`.strip
      end

      COLORIZE = defined?(::Console::ANSICode) && ENV.has_key?('TERM')
      if COLORIZE
        PASS = ::Console::ANSICode.green '.'
        FAIL = ::Console::ANSICode.red ' FAIL'
        ERROR = ::Console::ANSICode.white(
                ::Console::ANSICode.on_red('ERROR'))
      else
        PASS = "."
        FAIL = " FAIL"
        ERROR = "ERROR"
      end
    end
  end
  end
  end

end
# EOF