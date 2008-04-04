# codecite require
require 'person'
# codecite gets
header = gets
# codecite array
people = []
# codecite loop
while (line = gets)
  p = Person.new
  p.first_name, p.last_name, p.age, p.email = line.split(',')
  people << p
end
# codecite loop
# codecite output
puts "Last person is #{people.last.first_name} #{people.last.last_name}"