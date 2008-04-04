require 'test/unit'

class ExampleTest < Test::Unit::TestCase
  def test_add
    assert_equal 4, 2+2
  end
  def test_divide
    assert_raises(ZeroDivisionError) {10/0}
  end
end

