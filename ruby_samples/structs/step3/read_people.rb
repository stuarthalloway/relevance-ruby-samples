# codecite CSV
require 'csv'
# codecite Struct
Person = Struct.new(*CSV.parse_line(gets).map{|l| l.downcase.to_sym})
# codecite inject
people = readlines.inject([]) do |people,line|
  line.split!
  people << Person.new(*CSV.parse_line(line))
end
# codecite inject
# codecite each
people.each {|p| puts p}
