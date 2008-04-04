# codecite struct
Person = Struct.new("Person", :name, :address)

# codecite new struct
p = Person.new('Stuart Halloway', 'Chapel Hill, NC')

# codecite members
puts p.members

# codecite each_pair
p.each_pair do |n,v|
  puts "%-10s: %s" % [n,v]
end
# codecite each_pair

# codecite ostruct
require 'ostruct'
n = OpenStruct.new(:first=>'Stuart', :last=>'Halloway')
p.name = n
p.address = OpenStruct.new(:city=>'Chapel Hill', :state=>'NC')
# codecite ostruct

# codecite bad each
p.each_pair do |n,v|
  puts "%-10s: %s" % [n,v]
end
# codecite bad each

# codecite enumerable
class OpenStruct
  include Enumerable
  def each(&block)
    @table.each(&block)
  end
end
# codecite enumerable

# codecite good each
p.each_pair do |n,v|
  puts "%-10s:" % [n]
  v.sort_by{|k,v|k.to_s}.each do |n,v|
    puts "     %-10s: %s" % [n,v]
  end
end
# codecite good each

 