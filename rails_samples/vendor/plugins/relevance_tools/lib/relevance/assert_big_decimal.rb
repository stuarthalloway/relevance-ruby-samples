class Test::Unit::TestCase
  def assert_big_decimal(expected, actual)
    assert actual.is_a?(BigDecimal)
    assert_equal BigDecimal(expected.to_s), actual
  end
end