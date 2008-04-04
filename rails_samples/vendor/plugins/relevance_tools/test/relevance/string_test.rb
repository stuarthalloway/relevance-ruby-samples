require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/string'

class StringTest < Test::Unit::TestCase  
  def test_methodize
    assert_equal "foo_bar", "Foo Bar".methodize
    assert_equal "this_is_a_test", "This IS a test".methodize
    assert_equal "another_test", "ANOTHER_TEST".methodize
  end
  
  def test_random
    result = String.random
    assert_equal 10, result.size
    result = String.random(15)
    assert_equal 15, result.size
    result = String.random(10, true)
    assert_equal 10, result.size
    assert result =~ /^[a-zA-Z]*$/
  end
end
