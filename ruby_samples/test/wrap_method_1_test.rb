require File.join(File.dirname(__FILE__), "test_helper.rb")

# codecite class
require 'flexmock'
class WrapMethod1Test < Test::Unit::TestCase
  include FlexMock::TestCase
  # codecite class

  def setup
    Object.send :remove_const, 'Person' if defined? Person
    require 'wrap_method_1.rb'
  end
  
  # codecite test
  def test_wrap
    p = Person.new('first','last')
    flexstub(p).should_receive(:puts).with("Setting first='New Value'").once
    p.first='New Value'
    # codecite test
    # codecite assert
    assert_equal('New Value', p.first)
  end

end