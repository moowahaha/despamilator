require 'rspec'
require File.dirname(__FILE__) + '/filters/shared_specs/filter_base_shared_spec.rb'

$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'despamilator'
require 'zlib'

def unzip_file filename
  Zlib::GzipReader.open(filename).read
end