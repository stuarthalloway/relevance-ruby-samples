require File.join(File.dirname(__FILE__), '/../test_helper')
require 'relevance/test_validates_presence_of'

class TestValidatesPresenceOfTest < Test::Unit::TestCase
  include ValidationHelper
  
  def test_success_path
    validations = [flexmock(:name => :name, :macro => :validates_presence_of)]
    (model = flexmock).should_receive(:reflect_on_all_validations => validations)
    flexmock(self).should_receive(:model_class_under_test => model).once
    
    self.class.test_validates_presence_of :name
    assert_success { test_name_required }
  end
  
  def test_failure_path
    validations = [flexmock(:name => :foobar, :macro => :validates_presence_of)]
    (model = flexmock).should_receive(:reflect_on_all_validations => validations)
    flexmock(self).should_receive(:model_class_under_test => model).once
    
    self.class.test_validates_presence_of :name
    assert_failure { test_name_required }
  end
end