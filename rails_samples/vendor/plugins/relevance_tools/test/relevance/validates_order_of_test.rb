require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/validates_order_of'

class ValidatesOrderOfTest < Test::Unit::TestCase
  class Widget < ActiveRecord::Base
    validates_order_of :low, :middle
    validates_order_of :low, :middle, :high, :allow_nil=>true
  end

  def test_missing_from_order
    t = Widget.new
    assert_equal false, t.valid?
    assert_equal "can't be blank", t.errors[:low]
    assert_equal "can't be blank", t.errors[:middle]
    assert_equal nil, t.errors[:high]
  end

  def test_right_order
    t = Widget.new
    t.low = "a"
    t.middle = "b"
    t.high = "c"
    assert_equal true, t.valid?
  end

  def test_wrong_order
    t = Widget.new
    t.low = "z"
    t.middle = "y"
    t.high = "x"
    assert_equal false, t.valid?
    assert_equal nil, t.errors[:low]
    assert_equal "low must be <= middle", t.errors[:middle].first
    assert_equal "middle must be <= high", t.errors[:high]
  end
  
end
