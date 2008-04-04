# codecite Person
Person = Struct.new(:first,:last)

# codecite unbound
class Person
  meth = instance_method(:'first=')
  # codecite unbound
  # codecite define
  define_method('first=') do |val|
    puts "Setting first to '#{val}'"
    meth.bind(self).call(val)
  end
  # codecite define
end

