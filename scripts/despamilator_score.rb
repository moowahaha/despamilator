#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), '..', 'lib', 'despamilator')
require 'zlib'

def check_file file
  text = file =~ /\.gz$/i ? Zlib::GzipReader.open(file).read : File.open(file).read

  puts "Testing #{file}:"
  puts "========================"
  puts text
  puts "========================"
  puts "\n"

  dspam = Despamilator.new(text)

  puts "Total Score: #{dspam.score}\n\n"

  puts "Matched by..." unless dspam.matches.empty?
  dspam.matches.each do |match|
    puts "\tFilter: #{match[:filter].name}"
    puts "\tScore:  #{match[:score]}"
    puts "\n"
  end
end

file_or_dir = ARGV[0] || raise("Usage: despamilator_spec.rb [file or dir]")

Dir.glob(file_or_dir).each do |file|
  check_file file
end