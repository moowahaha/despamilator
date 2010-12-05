ENV['WITH_COVERAGE'] = '1'

desc "Run the spec tests with coverage"
task :test do
  Rake::Task[:spec].invoke
end