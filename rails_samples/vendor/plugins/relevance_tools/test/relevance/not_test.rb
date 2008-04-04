require File.join(File.dirname(__FILE__), '/../test_helper')
require 'relevance/not'

class NotTest < Test::Unit::TestCase
  
  def test_not_negates_true_to_false
    assert_equal false, nil.not.nil?
  end
  
  def test_not_negates_false_to_true
    assert_equal true, Object.new.not.nil?
  end
  
end