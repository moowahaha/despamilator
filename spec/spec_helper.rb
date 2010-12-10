require 'simplecov'

Dir.glob(File.join(File.dirname(__FILE__), 'helpers', '*.rb')).each do |file|
  require file
end

SimpleCov.start if ENV['WITH_COVERAGE']

SimpleCov.at_exit do
  SimpleCov.result.format!
  raise "Coverage is too low (#{SimpleCov.result.covered_percent})!" if SimpleCov.result.covered_percent < 100.0
end

require File.join(File.dirname(__FILE__), '..', 'lib', 'despamilator')
