#!/usr/bin/env ruby
require 'json'

begin
  thisfile = File.readlink(File.realpath(__FILE__))
rescue Errno::EINVAL
  thisfile = File.realpath(__FILE__)
end

DIR=File.dirname(thisfile)

map = JSON.parse(File.open("#{DIR}/twemoji/v2/keywords.json").read)
STDIN.read.each_line do |line|
  input = line.chomp
  code = map.fetch(input, input)
  output = code == input ? code : code.to_i(16).chr(Encoding::UTF_8)
  print output
end
