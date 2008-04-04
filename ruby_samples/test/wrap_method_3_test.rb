require 'test/unit'
require 'wrap_method_3.rb'

# codecite class
class WrapMethod3Test < Test::Unit::TestCase
  # codecite class
  
  # codecite test
  def test_wrap_method
    clazz = Class.new do
      attr_accessor :one, :called
    end
    # codecite test
    # codecite wrap
    clazz.wrap_method(:'one=') do |obj, meth, *args|
      obj.called=true
      meth.call(*args)
    end
    # codecite wrap
    # codecite inst
    inst = clazz.new
    inst.one='x'
    # codecite inst
    # codecite assert
    assert_equal('x', inst.one)
    assert_equal true,inst.called
    # codecite assert
  end
  
end