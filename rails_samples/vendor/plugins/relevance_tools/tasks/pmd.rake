namespace :test do
  task :pmd do
    path = ENV['CC_BUILD_ARTIFACTS'] || (RAILS_ROOT + '/tmp')
    output_file = File.join(path, 'pmd.txt')
    ENV['LANGUAGE'] = 'ruby'
    ENV['MINIMUM_TOKENS'] ||= '50'
    results = `/usr/local/pmd-4.0/bin/cpd.sh app/`
    File.open(output_file, 'w+') do |file|
      file.print results
    end
  end
end