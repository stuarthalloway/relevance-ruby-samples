#!/usr/bin/env ruby
ARGV.size > 0 || raise("Usage: #{__FILE__} url")

def get_hrefs(stream)
  hrefs = []
  while line=stream.gets
    hrefs.concat line.scan(/href=['"]([^'"]+)['"]/i).flatten
  end
  hrefs.sort.uniq
end

require 'open-uri'
urls = []
open(ARGV[0]) do |f|
  puts get_hrefs(f)
end
