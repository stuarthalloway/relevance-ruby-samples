require 'test/unit'
require 'palindrome_2'

class Palindrome2Test < Test::Unit::TestCase
  include Palindrome
  
  def test_string_palindrome
    assert('abba'.palindrome?)
    assert('ababa'.palindrome?)
    assert(!'boo'.palindrome?)
    assert(!'bobo'.palindrome?)
  end
  
  def test_NORMALIZER
    assert_equal 'foo', NORMALIZER['FOO']
    assert_equal 'foobar', NORMALIZER['foo bar']
    assert_equal 'foobar', NORMALIZER['foo::bar']
  end
  
  def test_int_palindrome
    assert(121.palindrome?)
    assert(1221.palindrome?)
    assert(!100.palindrome?)
    assert(!1010.palindrome?)
  end

  # This test fails under rcov, presumably the name collision with palindrome.rb
  # Not bothering to fix this because the real-world fix would be to simply
  # remove the collision.  
  def test_block_args
    assert('blah'.palindrome?{|x| 'abba'})
    assert(!'blah'.palindrome?{|x| 'boo'})
  end
  
end

