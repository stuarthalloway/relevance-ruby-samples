# codecite hello
puts "Hello, world"
name = gets
puts "Hello, #{name}"
# codecite hello

# codecite array
words = ["one", "two", "three", "four", "five"]
words.each {|i| puts i}
# codecite array

# codecite hash
ordinal_cordinal = {"one"=>"first", "two"=>"second", "three"=>"third"}
ordinal_cordinal.each {|k,v| puts "#{k} comes #{v}"}
# codecite hash

# codecite circle
class Circle
  attr_accessor :radius, :x, :y
  def area
    Math::PI*radius**2
  end
end
# codecite circle

# codecite instance
c = Circle.new
c.radius = 4
puts "Circle of radius #{c.radius} has area #{c.area}"
# codecite instance

# codecite capitalize
def capitalize_each_word(str)
  str.split(" ").each {|s|s.capitalize!}.join(" ")
end
puts capitalize_each_word("this is interesting")
# codecite capitalize
