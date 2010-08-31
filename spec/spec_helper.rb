begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'despamilator'

require 'zlib'

def unzip_file filename
  Zlib::GzipReader.open(filename).read
end