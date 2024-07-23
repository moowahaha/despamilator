require 'one_hundred_percent_coverage' if ENV['WITH_COVERAGE'].to_i == 1
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'despamilator')

Dir.glob(File.join(File.dirname(__FILE__), '*.rb')).each do |file|
  require file
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
