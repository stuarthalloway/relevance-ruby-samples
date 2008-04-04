# codecite splat
def sum(*args)
  sum = 0
  args.each { |item| sum += item }
  sum
end
puts sum(2,1,3,4)
# codecite splat

# codecite inject
def sum(*args)
  args.inject(0) { |sum, item| sum += item }
end

puts sum(2,1,3,4)
# codecite inject

# codecite duck typing
def total(*args)
  args.inject(nil) do |acc, item| 
    acc ? acc + item : item
  end
end

puts total(2,1,3,4)
puts total("one", "two")
p total([1,2], [3,4])
# codecite duck typing

# codecite gets and chomp
name = gets
puts "Hello #{name}, how are you?"
puts "Greetings #{name.chomp}, how are you?"
# codecite gets and chomp

# codecite creating accessors
person = Class.new do
# symbols are names
attr_accessor :first_name, :last_name

# strings are mutable
(1..2).each {|x| attr_accessor "address_#{x}"}
end
p = person.new
p.first_name = "Rob"
p.address_1 = "100 Europa Drive"
# codecite creating accessors

# codecite time and date
require "date"
print "Days of the week: "
p Date::DAYNAMES
today = Date.today
puts "Today is #{today}"

now = Time.now
puts "Now it is #{now}"
puts "It is #{now.strftime("%H:%M")}"
puts "The year is #{now.year}"  
# codecite time and date

# codecite structs
Car = Struct.new(:miles, :gas_level)
car = Car.new(0, 100)
puts "I have driven #{car.miles} miles."
car = Car.new(12000, 90)
puts "I have driven #{car.miles} miles."
puts "I have #{car.gas_level} gallons left."
# codecite structs

# codecite split and parse_line
input = 'He said,"Yes it is, a great day"'
puts input.split(',')

require 'csv'
puts CSV.parse_line(input)  
# codecite split and parse_line



















         

















         


















         

















         


















         

















         


