require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/object_additions'

class ObjectAdditionsTest < Test::Unit::TestCase
  def test_should_get_metaclass
    obj = Object.new
    metaklass = (class << obj; self; end;)
    assert_equal metaklass, obj.metaclass
  end
  
  def test_should_be_able_to_add_methods_to_the_meta_class
    obj = Object.new
    obj.meta_def(:speak) { "bark!" }
    assert obj.respond_to?(:speak)

    another_obj = Object.new
    assert_false another_obj.respond_to?(:speak)
  end
  
  class Foo; end
  
  def test_should_be_able_to_define_instance_methods_from_the_class
    Foo.class_def(:hi) { "hello!" }
    assert_equal "hello!", Foo.new.hi
    assert_false Foo.respond_to?(:hi)
  end
  
  def test_assert_big_decimal
    assert 'Object Addition Test', self.class_titleize
  end
end