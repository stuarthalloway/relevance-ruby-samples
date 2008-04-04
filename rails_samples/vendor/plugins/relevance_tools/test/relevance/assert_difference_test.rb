require File.join(File.dirname(__FILE__), '/../test_helper')
require 'relevance/assert_difference'

class AssertDifferenceTest < Test::Unit::TestCase
  
  class Incrementor
    attr_accessor :count
    def initialize
      @count = 0
    end
    def increment
      @count += 1
    end
  end
  
  def setup
    @incrementor = Incrementor.new
  end
  
  def test_assert_difference
    assert_nothing_raised do
      assert_difference @incrementor, :count do
        @incrementor.increment
      end
    end
  end
  
  def test_assert_difference_fails
    assert_raises Test::Unit::AssertionFailedError do
      assert_difference @incrementor, :count do
        # do nothing
      end
    end
  end
  
  def test_assert_difference_with_multiple_objects
    incrementor_two = Incrementor.new
    assert_nothing_raised do
      assert_difference [@incrementor, incrementor_two], :count do
        @incrementor.increment
        incrementor_two.increment
      end
    end
  end
  
  def test_assert_difference_with_multiple_objects_fails
    incrementor_two = Incrementor.new
    assert_raises Test::Unit::AssertionFailedError do
      assert_difference [@incrementor, incrementor_two], :count do
        @incrementor.increment
        # do nothing with incrementor_two
      end
    end
  end
  
  def test_assert_difference_by_passing_difference
    assert_nothing_raised do
      assert_difference @incrementor, :count, 3 do
        3.times { @incrementor.increment }
      end
    end
  end
  
  def test_assert_no_difference
    assert_nothing_raised do
      assert_no_difference @incrementor, :count do
        # do nothing
      end
    end
  end
  
  def test_assert_no_difference_fails
    assert_raises Test::Unit::AssertionFailedError do
      assert_no_difference @incrementor, :count do
        @incrementor.increment
      end
    end
  end
  
end