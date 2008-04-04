require 'rubygems'

# codecite class
require 'flexmock'
class WrapMethod2Test < Test::Unit::TestCase
  include FlexMock::TestCase
  # codecite class

  def setup
    Object.send :remove_const, 'Person' if defined? Person
    require 'wrap_method_2.rb'
  end

  # codecite test
  def test_wrap
    p = Person.new('first','last')
    flexstub(p).should_receive(:puts).with("Setting first to 'New Value'").once
    p.first='New Value'
    # codecite test
    # codecite assert
    assert_equal('New Value', p.first)
  end

end