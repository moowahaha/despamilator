#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), '..', 'lib', 'despamilator')
require 'zlib'

file = ARGV[0] || raise("Usage: despamilator_spec.rb [filename]")

text = file =~ /\.gz$/i ? Zlib::GzipReader.open(file).read : File.open(file).read

puts "Testing:"
puts "========================"
puts text
puts "========================"
puts "\n"

dspam = Despamilator.new(text)

puts "Total Score: #{dspam.score}\n\n"

puts "Matched by..." unless dspam.matched_by.empty?
dspam.matched_by.each do |match|
  puts "\tFilter: #{match.name}"
  puts "\tScore:  #{match.score}"
  puts "\n"
end