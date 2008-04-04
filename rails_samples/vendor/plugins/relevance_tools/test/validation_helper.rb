module ValidationHelper
  
  def assert_success(&block)
    assert_nothing_raised { yield }
  end
  
  def assert_failure(&block)
    assert_raises(Test::Unit::AssertionFailedError) { yield }
  end
  
end