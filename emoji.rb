#!/usr/bin/env ruby
require 'json'

DIR=File.dirname(__FILE__)

map = JSON.parse(File.open("#{DIR}/twemoji/v2/keywords.json").read)
STDIN.read.each_line do |line|
  input = line.chomp
  code = map.fetch(input, input)
  output = code == input ? code : code.to_i(16).chr(Encoding::UTF_8)
  puts output
end
