# codecite repeat
require 'person'
header = gets
people = []
while (line = gets)
  p = Person.new
  p.first_name, p.last_name, p.age, p.email = line.split(',')
  people << p
end
# codecite repeat
# codecite each
people.each do |p|
  puts "#{p} is #{p.age}"
end
# codecite each