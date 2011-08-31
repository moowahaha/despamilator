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

  dspam.score
end

file_or_dir = ARGV[0] || raise("Usage: despamilator_spec.rb [file or dir]")

results = []

Dir.glob(file_or_dir).each do |file|
  score = check_file file
  results << [file, score]
end

puts "\n\n"

results.sort {|a, b| b[1] <=> a[1]}.each do |file, score|
  puts "#{file} | #{score}"
end