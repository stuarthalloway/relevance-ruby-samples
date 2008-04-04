# codecite create connection
require 'rubygems'
gem 'activerecord'
require 'activerecord'
ActiveRecord::Base.establish_connection :adapter=>'mysql', 
                                        :database=>'rails_samples_development'
# codecite create connection

# codecite create BaseballPlayer
class BaseballPlayer < ActiveRecord::Base 
  def to_s
    "BaseballPlayer #{first_name} #{last_name}"
  end
end
# codecite create BaseballPlayer

# codecite create instances
['Stu Halloway','Justin Gehtland', 'Glenn Vanderburg'].each do |name|
  fn, ln = name.split(' ')
  BaseballPlayer.create(:first_name=>fn, :last_name=>ln)
end
BaseballPlayer.new(:first_name=>'Ben', :last_name=>'Franklin').save
# codecite create instances

# codecite enumerate
puts "Total of #{BaseballPlayer.count} people"
BaseballPlayer.find(:all, :order=>'last_name').each do |p|
  puts "Found #{p}"
end
# codecite enumerate

# codecite find_by_last_name
p = BaseballPlayer.find_by_last_name('Gehtland')
puts "Found #{p}"
p = BaseballPlayer.find_by_last_name('Nobody')
puts "Find Nobody == #{p}"
# codecite find_by_last_name

# codecite find first
p = BaseballPlayer.find(:first, :conditions=>['first_name = ?', 'Stu'])
puts "Find (:conditions) found #{p}"
# codecite find first

# codecite validation
class BaseballPlayer 
  validates_presence_of :first_name, :last_name
end
p = BaseballPlayer.new
p.valid?
puts "Error: #{p.errors[:first_name]}"
# codecite validation

