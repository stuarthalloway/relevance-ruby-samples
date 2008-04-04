require 'rubygems'
require 'test/unit'
require 'stringio'
require 'test/spec'
require 'mocha'
%w{recording_standard_streams}.each do |file|
  require File.join(File.dirname(__FILE__), "util", file)
end

$: << File.join(File.dirname(__FILE__), "..")

