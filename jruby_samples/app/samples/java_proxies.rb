require 'java'

object_list = [1,2,3].to_java
puts object_list.java_class

float_list = [1,2,3].to_java :float
puts float_list.java_class 

array_list = java.util.ArrayList.new [1,2,3]

JavaUtilities.extend_proxy('java.util.Collection') do
  def each_square
    each {|item| yield item*item}
  end
end

array_list.each_square {|item| puts "Square is #{item}"}