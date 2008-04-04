require File.join(File.dirname(__FILE__), '/../test_helper')
require 'relevance/test_validates_ssn'

class TestValidatesSsnTest < Test::Unit::TestCase
  include ValidationHelper
  
  def test_validates_ssn
    (model = flexmock).should_receive("number=" => nil, :valid? => false,
      :errors => flexmock(:on => "must be of format ###-##-####")).once
    flexmock(self).should_receive(:model_class_under_test => flexmock(:new => model)).once
    
    self.class.test_validates_ssn :number
    assert_nothing_raised { test_number_is_valid_ssn }
  end
  
  def test_validates_ssn_when_valid_returns_true
    (model = flexmock).should_receive("number=" => nil, :valid? => true,
      :errors => flexmock(:on => "must be of format ###-##-####")).once
    flexmock(self).should_receive(:model_class_under_test => flexmock(:new => model)).once
    
    self.class.test_validates_ssn :number
    assert_failure { test_number_is_valid_ssn }
  end
  
  def test_validates_ssn_when_errors_array_is_empty
    (model = flexmock).should_receive("number=" => nil, :valid? => true, :errors => []).once
    flexmock(self).should_receive(:model_class_under_test => flexmock(:new => model)).once
    
    self.class.test_validates_ssn :number
    assert_failure { test_number_is_valid_ssn }
  end
  
  def test_validates_presence_of_when_error_message_is_incorrect
    (model = flexmock).should_receive("number=" => nil, :valid? => true,
      :errors => flexmock(:on => "must be unique")).once
    flexmock(self).should_receive(:model_class_under_test => flexmock(:new => model)).once
    
    self.class.test_validates_ssn :number
    assert_failure { test_number_is_valid_ssn }
  end
end