require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < Test::Unit::TestCase
  fixtures :contacts

  # codecite test_first_name_validation
  def test_first_name_validation
    c = Contact.new
    assert !c.valid?
    assert_equal "can't be blank", c.errors[:first_name]
  end
  # codecite test_first_name_validation

  # codecite test_last_name_validation
  def test_last_name_validation
    c = Contact.new
    assert !c.valid?
    assert_equal "can't be blank", c.errors[:last_name]
  end
  # codecite test_last_name_validation

  # codecite john doe full name
  def test_full_name_for_john_doe
    c = Contact.new(:first_name => "John", :last_name=>"Doe")
    assert_equal "John Doe", c.full_name
  end
  # codecite john doe full name

  # codecite new contact full name
  def test_full_name_for_new_contact
    c = Contact.new
    assert_equal "", c.full_name
  end
  # codecite new contact full name
  
  # codecite test_find_by_first_name
  def test_find_by_first_name
    assert_equal(contacts(:justin), Contact.find_by_first_name("Justin"))
  end
  # codecite test_find_by_first_name

  # codecite test_find_all_by_last_name
  def test_find_all_by_last_name
    assert_equal([contacts(:gabe), contacts(:justin)], Contact.find_all_by_last_name("Gehtland"))
  end
  # codecite test_find_all_by_last_name
  
end
