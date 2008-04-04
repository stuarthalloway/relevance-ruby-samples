require 'rcov'
require "rcov/rcovtask"

namespace :rcov do
  rcov_output = ENV["CC_BUILD_ARTIFACTS"] || 'tmp/coverage'
  
  desc "Delete aggregate coverage data."
  task(:clean) { rm_f "rcov_tmp" }
  
  Rcov::RcovTask.new(:unit_for_combined_report => [:clean, 'db:migrate', 'db:test:prepare']) do |t|
    t.test_files = FileList['test/unit/**/*_test.rb']
    t.rcov_opts = ["--aggregate 'rcov_tmp'", "--html", "--rails", "--exclude 'db,lib'", '--sort coverage']
    t.output_dir = rcov_output + '/unit'
  end
  
  desc "Generate combined unit and functional test coverage report"
  Rcov::RcovTask.new(:unit_and_functional => :unit_for_combined_report) do |t|
    t.test_files = FileList['test/functional/**/*_test.rb']
    t.rcov_opts = ["--aggregate 'rcov_tmp'", '--html', '--rails', "--exclude 'db,lib'", '--sort coverage']
    t.output_dir = rcov_output + '/unit_and_functional'
  end
  
  desc "Generate and open coverage report"
  task(:all => [:unit_for_combined_report, :unit_and_functional]) do
    system("open #{rcov_output}/unit_and_functional/index.html") if PLATFORM['darwin']
  end
end