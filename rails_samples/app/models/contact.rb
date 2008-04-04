class Contact < ActiveRecord::Base
  # codecite validates presence of
  validates_presence_of :first_name, :last_name
  # codecite validates presence of

  # codecite better full_name
  def full_name
    [first_name, last_name].compact.join(" ")
  end
  # codecite better full_name
end

__END__
# codecite inferior full_name
def full_name
  "#{first_name} #{last_name}"
end
# codecite inferior full_name
