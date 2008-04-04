require File.join(File.dirname(__FILE__), "/../../test_helper")
require File.join(File.dirname(__FILE__), "/../../fixtures")
require 'relevance/active_record/create_or_update'

class Relevance::ActiveRecord::CreateOrUpdateTest < Test::Unit::TestCase
  include FlexMock::TestCase

  def test_create
    w = Widget.new
    inventor = w.create_or_update_association(:inventor, :first_name => 'Thomas')
    assert_kind_of Inventor, inventor
    assert_equal false, inventor.new_record?
  end
  
  def test_update
    flexmock(Inventor).new_instances.should_receive(:save).twice
    w = Widget.new
    inventor = w.create_or_update_association(:inventor, :first_name => 'Alexander', :last_name => 'Carver')
    w.create_or_update_association(:inventor, :first_name => 'George')
    assert_equal 'George', w.inventor.attributes["first_name"]
    assert_equal 'Carver', w.inventor.attributes["last_name"]
  end
end
