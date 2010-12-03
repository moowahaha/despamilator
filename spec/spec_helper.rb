require 'rspec'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'despamilator'

require 'zlib'

def unzip_file filename
  Zlib::GzipReader.open(filename).read
end