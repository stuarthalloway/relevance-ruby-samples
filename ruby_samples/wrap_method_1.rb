# codecite Person
Person = Struct.new(:first,:last)

# codecite alias
class Person
  alias_method :'old_first=', :'first='
  # codecite alias
  # codecite wrap
  def first=(val)
    puts "Setting first='#{val}'"
    self.old_first=val
  end
  # codecite wrap
end

