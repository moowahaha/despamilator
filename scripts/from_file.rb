#!/usr/bin/env ruby

require 'cgi'

slots = {};

1.upto(10000) do |i|
  slots[i] = true
end

dir = './spec/spam_corpus/'

Dir[dir + '*.gz'].each do |file|
  slots.delete(file.scan(/\d+/).first.to_i)
end

slots = slots.keys.sort

txt = dir + "#{slots.shift}.txt"
contents = File.open(ARGV[0] || raise).read
File.open(txt, 'w') do |fh|
  fh.puts CGI.unescapeHTML(contents)
end
`gzip #{txt}`
