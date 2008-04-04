# To use this you must install the following
# Rcov
# AspectR
# Test:Report
#
# To create html reports from your tests
# Create a testreport directory
# rake -rpath_to_this_file test
require 'rubygems'
gem 'rake'
require 'test/unit'
require 'test/unit/ui/console/testrunner'
require 'test/unit/ui/reporter'
require 'test/unit/ui/report/htmlformatter'
require 'rake/testtask'
require 'rcov/rcovtask'

module Relevance
  class Test::Unit::UI::Reporter::HtmlRunner
    def self.run(suite, output_level)
      Test::Unit::UI::Reporter.run(suite, ENV["CC_BUILD_ARTIFACTS"] || 'testreport', :html, 
          Test::Unit::UI::Console::TestRunner)
    end
  end

  # monkey patch Test::Unit
  Test::Unit::AutoRunner::RUNNERS.merge!({
    :html => Proc.new {Test::Unit::UI::Reporter::HtmlRunner}
  })

  # monkey patch your existing TestTasks and RcovTasks
  require 'aspectr'
  include AspectR
  class AlternateTestRunner < Aspect
    require 'pathname'
    THIS_FILE = Pathname.new(__FILE__).expand_path.to_s
    def initialize(runner)
      @runner = runner
    end
    def before_define(method, object, exit, *args)
      object.ruby_opts << ["-r#{THIS_FILE}"]
      (object.options ||= "") << "--runner=#{@runner}"
    end
  end
  atr = AlternateTestRunner.new("html")
  atr.wrap(Rake::TestTask, :before_define, nil, :define)
  # TBD: rcov does not use the options object
  # atr.wrap(Rcov::RcovTask, :before_define, nil, :define)
end