$:.unshift(File.dirname(__FILE__) + '/../lib')
require File.join(File.dirname(__FILE__),'ar_helper')
require File.join(File.dirname(__FILE__),'as_helper')
require File.join(File.dirname(__FILE__),'validation_helper')
require File.expand_path(File.join(File.dirname(__FILE__),'/../lib/relevance/turn'))  unless Object.const_defined?("TextMate")
require 'test/unit'
require 'flexmock/test_unit'
require 'active_record/fixtures'

class Test::Unit::TestCase
  self.fixture_path = File.dirname(__FILE__) + "/fixtures/"
  
  def assert_false(cond, msg = nil)
    assert !cond, msg
  end     
end
