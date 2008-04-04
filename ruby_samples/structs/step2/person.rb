# codecite attr_accessor
class Person
  attr_accessor :first_name, :last_name, :age, :email
  # codecite attr_accessor
  # codecite to_s
  def to_s
    "#{self.class}: #{first_name} #{last_name}"
  end
  # codecite to_s
end