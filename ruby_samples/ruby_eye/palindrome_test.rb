require 'test/unit'
require 'palindrome'

class PalindromeTest < Test::Unit::TestCase
   def test_palindrome
    assert(palindrome?('abba'))
    assert(palindrome?('ababa'))
    assert(!palindrome?('boo'))
    assert(!palindrome?('bobo'))
  end
  
  def test_string_palindrome
    assert('abba'.palindrome?)
    assert('ababa'.palindrome?)
    assert(!'boo'.palindrome?)
    assert(!'bobo'.palindrome?)
  end
  
  def test_ancestors
    assert_member String.ancestors, PuzzleExtensions
  end
  
  def assert_member(coll,item)
    assert(coll.member?(item))
  end
end

