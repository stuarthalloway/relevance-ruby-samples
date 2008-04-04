require File.expand_path(File.join(File.dirname(__FILE__), "/../test_helper"))
require File.expand_path(File.join(File.dirname(__FILE__), "/../../lib/relevance/turn"))
require 'mocha'

# TODO move this into core relevance tools
module Kernel
  def silence_warnings
    old_verbose, $VERBOSE = $VERBOSE, nil
    yield
  ensure
    $VERBOSE = old_verbose
  end
end

class TurnTest < Test::Unit::TestCase
  
  def test_should_work_with_facets_version_2_and_up
     TurnHelper.expects(:running_in_cruise?).returns(false)
     TurnHelper.expects(:require_ansicode_for_old_facets).raises(LoadError)
     TurnHelper.expects(:require_ansicode_for_new_facets).returns(true)
     assert TurnHelper.require_ansicode_unless_cc
   end
   
   def test_should_warn_to_stderr_if_both_requires_fail
     TurnHelper.expects(:running_in_cruise?).returns(false)
     TurnHelper.expects(:require_ansicode_for_old_facets).raises(LoadError)
     TurnHelper.expects(:require_ansicode_for_new_facets).raises(LoadError)
     STDERR.expects(:puts).with("Can't load ansicode - test coloring will not work!")
     TurnHelper.require_ansicode_unless_cc
   end
   
   def test_should_test_on_textmate_constant_for_detecting_textmate
     original_textmate_constant = Object.const_get("TextMate") rescue nil
     silence_warnings do
       Object.const_set("TextMate", "anything")
       assert TurnHelper.running_in_textmate?
       Object.send(:remove_const, "TextMate")
     end
     assert_false TurnHelper.running_in_textmate?
   
   ensure
     if original_textmate_constant 
       Object.const_set("TextMate", original_textmate_constant)
     end 
   end
   
   def test_happy_path
     runner = Test::Unit::UI::Console::TestRunner.new("")
     backtrace = [%Q{/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.3/lib/active_support/dependencies.rb:477:in `const_missing'},
        %Q{test/relevance/turn_test.rb:25:in `test_should_warn_to_stderr_if_both_requires_fail'},
        %Q{/opt/local/lib/ruby/gems/1.8/gems/mocha-0.5.5/lib/mocha/test_case_adapter.rb:19:in `__send__')}]
     fault_and_line = ["/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.3/lib/active_support/dependencies.rb", "477"]
     assert_equal fault_and_line, runner.fault_to_file_and_line(backtrace)
   end
  
  def test_should_escape_special_regex_characters_in_backtrace
    # horrible hacks to get this under test
    runner = Test::Unit::UI::Console::TestRunner.new("")
    runner.instance_variable_set(:@test_unformatted, %q(should do stuff with regex special chars (1-2) ../))
    backtrace = ["test/relevance/turn_test.rb:61:in `should do stuff with regex special chars (1-2) ../'", 
                 "/opt/local/lib/ruby/gems/1.8/gems/mocha-0.5.5/lib/mocha/test_case_adapter.rb:19:in `__send__'", 
                 "/opt/local/lib/ruby/gems/1.8/gems/mocha-0.5.5/lib/mocha/test_case_adapter.rb:19:in `run'"]
    assert_equal ["test/relevance/turn_test.rb", "61"], runner.fault_to_file_and_line(backtrace)
  end
  
end
