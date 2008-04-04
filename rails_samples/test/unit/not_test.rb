# codecite requires
require File.dirname(__FILE__) + '/../test_helper'
require 'not'
# codecite requires

class NotTest < Test::Unit::TestCase
  # codecite fixed_test_not_negates_true_to_false
  # codecite test_not_negates_true_to_false
  def test_not_negates_true_to_false
    assert_equal false, nil.not.nil?
    # codecite test_not_negates_true_to_false
    assert_equal false, "".not.empty?
  # codecite test_not_negates_true_to_false
  end
  # codecite test_not_negates_true_to_false
  # codecite fixed_test_not_negates_true_to_false

  # codecite test_not_negates_false_to_true
  def test_not_negates_false_to_true
    assert_equal true, "foo".not.nil?
  end
  # codecite test_not_negates_false_to_true
end
