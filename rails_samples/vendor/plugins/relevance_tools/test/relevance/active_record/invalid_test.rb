require File.join(File.dirname(__FILE__), "/../../test_helper")
require File.join(File.dirname(__FILE__), "/../../fixtures")
require 'relevance/active_record/invalid'

class Relevance::ActiveRecord::InvalidTest < Test::Unit::TestCase

  def test_should_be_invalid
    c = Contract.new
    assert c.invalid?
  end
  
  def test_should_not_be_invalid
    c = Contract.new(:start_date => Time.now)
    assert_false c.invalid?
    assert c.valid?
  end  
end
