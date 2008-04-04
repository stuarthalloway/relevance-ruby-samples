require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/validates_number'

class ValidatesNumberTest < Test::Unit::TestCase
  class Widget < ActiveRecord::Base
    attr_accessor :turn_off_validation
    validates_number :low, :min => -10, :max => 0, :scale => 2, :if => Proc.new { |e| !e.turn_off_validation  }
  end
    
  def test_nil
    t = Widget.new
    t.valid?
    assert_equal "must be a number", t.errors[:low]
  end

  def test_min
    t = Widget.new
    t.low = -20
    t.valid?
    assert_equal "must be a number, at least -10", t.errors[:low]
  end

  def test_max
    t = Widget.new
    t.low = 10
    t.valid?
    assert_equal "must be a number, at most 0", t.errors[:low]
    t.low = 0
    t.valid?
    assert_nil t.errors[:low]
  end

  def test_scale
    t = Widget.new
    t.low = -0.666
    t.valid?
    assert_equal "must be a number, at most 2 decimal places", t.errors[:low]
    t.low = -0.55
    t.valid?
    assert_nil t.errors[:low]
  end
  
  def test_if
    t = Widget.new
    t.low = -20
    t.valid?
    assert_equal "must be a number, at least -10", t.errors[:low]
    t.turn_off_validation = true
    t.valid?
    assert_nil t.errors[:low]
  end
end
