task 'test' => ['test:helpers']

namespace :test do
  Rake::TestTask.new(:helpers => [ "db:test:prepare" ]) do |t|
    t.libs << "test"
    t.pattern = 'test/helper/**/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:helpers'].comment = "Run the helper tests in test/helper"
end
