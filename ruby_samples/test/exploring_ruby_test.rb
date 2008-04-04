require File.join(File.dirname(__FILE__), "test_helper.rb")

class ExporingRubyTest < Test::Unit::TestCase
  
  def test_all
    expected=<<END
Hello, world
Hello, 
one
two
three
four
five
three comes third
two comes second
one comes first
Circle of radius 4 has area 50.2654824574367
This Is Interesting
END
    s = StringIO.new
    s << ""
    s.rewind
    # TODO: figure out how to mock gets better. Having to do argv, $*, and stdin is a pain
    With.argv([]) do
      begin
        backup = $*.dup
        $*.clear
        Playing.stdin(s) do
          out = Recording.stdout do
            load class_tested_by(__FILE__)
          end
          assert_equal(expected, out.read)
        end
      ensure 
        $*.concat backup
      end
    end
  end
end

module Labs
  # codecite unit test
  require 'test/unit'
  require 'circle'
  class TestCircle < Test::Unit::TestCase
    def test_area
      c = Circle.new
      c.radius = 5
      assert_equal(Math::PI*c.radius**2, c.area)
    end
  
    def test_radius
      c = Circle.new
      c.radius = 5
      assert_equal(5, c.radius)
    end
  end
  # codecite unit test
end

