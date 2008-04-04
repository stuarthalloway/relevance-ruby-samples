require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/validates_ssn'

class ValidatesSsnTest < Test::Unit::TestCase
  FORMAT_MSG = 'must be of format ###-##-####'
  
  class Widget < ActiveRecord::Base
    attr_accessor :ssn, :ssn_two
    validates_ssn :ssn, :ssn_two
  end
  
  def setup
    @w = Widget.new
  end
  
  def test_nil
    assert @w.valid?
  end

  def test_partial
    @w.ssn = '123'
    assert !@w.valid?
    assert_equal FORMAT_MSG, @w.errors[:ssn]
  end
  
  def test_one_valid_the_other_not
    @w.ssn = '123-12-1234'
    @w.ssn_two = '456'
    assert !@w.valid?
    assert @w.errors[:ssn].nil?
    assert_equal FORMAT_MSG, @w.errors[:ssn_two]
  end
  
  def test_full
    @w.ssn = '123-12-1234'
    @w.ssn_two = '456-45-4567'
    assert @w.valid?
  end
end
