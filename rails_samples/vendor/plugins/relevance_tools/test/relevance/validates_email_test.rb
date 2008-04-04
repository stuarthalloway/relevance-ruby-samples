require File.join(File.dirname(__FILE__), "/../test_helper")
require "relevance/validates_email"

class ValidatesEmailTest < Test::Unit::TestCase
  FORMAT_MSG = "is not a valid e-mail address"
  
  class Widget < ActiveRecord::Base
    attr_accessor :email, :email_two
    validates_email :email, :email_two
  end
  
  def setup
    @w = Widget.new
  end
  
  def test_nil
    assert @w.valid?
  end

  def test_partial
    @w.email = "foobar"
    assert !@w.valid?
    assert_equal FORMAT_MSG, @w.errors[:email]
  end
  
  def test_one_valid_the_other_not
    @w.email = "foo@bar.com"
    @w.email_two = "foobar"
    assert !@w.valid?
    assert @w.errors[:email].nil?
    assert_equal FORMAT_MSG, @w.errors[:email_two]
  end
  
  def test_full
    @w.email = "foo@bar.com"
    @w.email_two = "bar@foo.com"
    assert @w.valid?
  end
end
