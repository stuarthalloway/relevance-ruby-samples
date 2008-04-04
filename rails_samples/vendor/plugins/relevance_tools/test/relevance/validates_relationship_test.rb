require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/validates_relationship'

class ValidatesRelationshipTest < Test::Unit::TestCase
  class Widget < ActiveRecord::Base
    validates_relationship "low+high", :match=>(1..10) 
  end
  class WidgetM < ActiveRecord::Base
    set_table_name :widgets
    validates_relationship "low+high", :match=>(1..10), :message=>"low + high should be between 1 and 10" 
  end

  def test_valid_relationship
    w = Widget.new
    w.low = 3
    w.high = 3
    assert w.valid?
    w.high = 8
    assert !w.valid?
    assert_equal "low+high should match 1..10", w.errors["low"]
    assert_equal "low+high should match 1..10", w.errors["high"]
  end

  def test_custom_message
    w = WidgetM.new
    w.low = 3
    w.high = 3
    assert w.valid?
    w.high = 8
    assert !w.valid?
    assert_equal "low + high should be between 1 and 10", w.errors["low"]
    assert_equal "low + high should be between 1 and 10", w.errors["high"]
  end
  
end
