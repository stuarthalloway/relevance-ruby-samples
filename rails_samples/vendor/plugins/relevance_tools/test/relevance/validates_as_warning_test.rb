require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/validates_as_warning'

class ValidatesAsWarningTest < Test::Unit::TestCase
  class Widget < ActiveRecord::Base
    include Relevance::ValidatesAsWarning
    validates_presence_of :low, :warning=>true
    validates_presence_of :high
  end
  
  def test_errors
    w = Widget.new
    assert_equal false,  w.valid?
    assert_equal true, w.warnings?
    assert_equal "can't be blank", w.errors["high"]
    assert_nil w.warnings["high"]
    w.high = 10
    assert_equal true,  w.valid?
    assert_equal true, w.warnings?
  end

  def test_warnings
    w = Widget.new
    assert_equal false, w.valid?
    assert_equal true, w.warnings?
    assert_equal "can't be blank", w.warnings["low"]
    assert_nil w.warnings["high"]
    w.low = 0
    assert_equal false, w.valid?
    assert_equal false, w.warnings?
  end
  
end
