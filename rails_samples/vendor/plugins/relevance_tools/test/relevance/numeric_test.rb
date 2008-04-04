require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/numeric'

class NumericTest < Test::Unit::TestCase
    
  def test_scale
    assert_equal 0, 10.scale
    assert_equal 1, 10.0.scale
    assert_equal 1, 10.00.scale   # this is a bit of a problem...
    assert_equal 2, 10.01.scale
  end
end
