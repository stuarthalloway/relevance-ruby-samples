require File.dirname(__FILE__) + '/../test_helper'
require 'relevance/date_math'

class DateMathTest < Test::Unit::TestCase
  def test_add
    date = Date.civil(2007,5,21)
    year_ago = date.add(-1, :years)
    assert_equal_date Date.civil(2006,5,21), year_ago
    day_ago = date.add(-1, :days)
    assert_equal_date Date.civil(2007,5,20), day_ago
    day_ago = date.add(-30, :days)
    assert_equal_date Date.civil(2007,4,21), day_ago
    assert_raise(ArgumentError) {date.add(4, :centuries)}
  end
  
  def assert_equal_date(expected, actual)
    assert_equal(expected,actual, "Expected #{expected.to_time}, got #{actual.to_time}")
  end
end