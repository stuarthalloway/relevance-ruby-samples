require File.join(File.dirname(__FILE__), "/../test_helper")
require File.join(File.dirname(__FILE__), "/../fixtures/contract")
require 'relevance/validates_match'

class ValidatesNoOverlapTest < Test::Unit::TestCase
  fixtures :contracts
  class Widget < ActiveRecord::Base; end

  def setup
    Widget.write_inheritable_attribute(:validate, nil)
  end

  def test_valid
    Widget.validates_match :low, :in=>(0..100)
    w = Widget.new(:low=>40)
    assert w.valid?
    w.low = 101
    assert !w.valid?
    assert_equal 'does not match 0..100', w.errors[:low]
  end

  def test_if
    Widget.validates_match :low, :in=>(0..100), :if=>Proc.new{false}
    w = Widget.new(:low=>40)
    assert w.valid?
    w.low = 101
    assert w.valid?
  end
  
  def test_message
    Widget.validates_match :low, :in=>(0..100), :message=>"just doesn't match"
    w = Widget.new(:low=>101)
    assert !w.valid?
    assert_equal 'just doesn\'t match', w.errors[:low]
  end
end
