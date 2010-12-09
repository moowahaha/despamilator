require 'simplecov'

require File.dirname(__FILE__) + '/filters/shared_specs/filter_base_shared.rb'

SimpleCov.start if ENV['WITH_COVERAGE']

SimpleCov.at_exit do
  SimpleCov.result.format!
  raise "Coverage is too low (#{SimpleCov.result.covered_percent})!" if SimpleCov.result.covered_percent < 100.0
end


$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'despamilator'
require 'zlib'

def unzip_file filename
  Zlib::GzipReader.open(filename).read
end
