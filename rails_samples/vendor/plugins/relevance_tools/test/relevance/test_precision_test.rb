require File.join(File.dirname(__FILE__), '/../test_helper')
require 'relevance/assert_big_decimal'
require 'relevance/test_precision'

class TestPrecisionTest < Test::Unit::TestCase
  class ModelClass; end
  
  def test_success_path
    (model = flexmock).should_receive(:columns => [flexmock(:name => "amount", :precision => 4, :scale => 2)]).once
    flexmock(self).should_receive(:model_class_under_test => model).once
    self.class.test_precision(:amount, :precision => 4, :scale => 2)
    assert_nothing_raised { test_amount_precision }
  end
  
  def test_failure_path
    (model = flexmock).should_receive(:columns => [flexmock(:name => "amount", :precision => 12, :scale => 4)]).once
    flexmock(self).should_receive(:model_class_under_test => model).once
    self.class.test_precision(:amount, :precision => 4, :scale => 2)    
    test_amount_precision
  rescue Exception => e
    assert e.message.include?("Expected precision to be 4, but was 12")
  end
end