require 'simplecov'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'despamilator')

Dir.glob(File.join(File.dirname(__FILE__), '*.rb')).each do |file|
  require file
end

SimpleCov.start if ENV['WITH_COVERAGE']

SimpleCov.at_exit do
  SimpleCov.result.format!

  if SimpleCov.result.covered_percent < 100.0
    warn "Coverage is too low (#{SimpleCov.result.covered_percent})!"
    exit -1
  end
end
