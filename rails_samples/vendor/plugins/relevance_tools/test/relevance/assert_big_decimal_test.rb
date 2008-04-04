require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/assert_big_decimal'

class AssertBigDecimalTest < Test::Unit::TestCase
  include ValidationHelper
  
  def test_assert_big_decimal
    assert_success { assert_big_decimal 1.153, BigDecimal('1.153') }
    assert_failure { assert_big_decimal 1.153, 1.153 }
    assert_failure { assert_big_decimal 5, 5 }
  end
end