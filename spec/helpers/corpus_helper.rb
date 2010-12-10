require 'zlib'

def unzip_file filename
  Zlib::GzipReader.open(filename).read
end
