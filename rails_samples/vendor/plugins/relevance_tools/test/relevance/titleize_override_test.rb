require File.dirname(__FILE__) + '/../test_helper'
require 'relevance/titleize_customizations'

class TitleizeOverrideTest  < Test::Unit::TestCase

  Inflector.inflections do |inflect|
    inflect.title 'ssn', 'SSN'
    inflect.title 'employee of', 'Employee of'
    inflect.title 'user id', 'User ID'
  end
    
  def test_opening_inflections
    assert_kind_of Hash, Inflector::Inflections.instance.titles
  end
  
  def test_adding_titleize_overrides 
    specs = { "Account Number" => ["Account Number", "Account number", "account Number", "account_number"],
              "SSN" => ["SSN", "ssn", "SsN"],
              "Employee of" => ["Employee of"],
              "User ID" => ["user id", "User ID", "User Id"] }

    specs.each do |expected, inputs| 
      inputs.each do |input|
        assert_equal expected, input.titleize
      end
    end
  end
end