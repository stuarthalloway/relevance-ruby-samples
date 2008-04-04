# codecite connection
require 'rubygems'
gem 'activerecord'
require 'activerecord'
ActiveRecord::Base.establish_connection :adapter=>'mysql', 
                                        :database=>'rails_samples_development'
# codecite connection

# codecite contact
class BaseballPlayer < ActiveRecord::Base
  validates_presence_of :first_name
  validates_length_of :first_name, :maximum=>255
end
# codecite contact

# codecite before_save
class BaseballPlayer
  before_save :normalize_names
  def normalize_names
    first_name.gsub!(/\s*(.*)\s*/, '\1') if first_name
    last_name.gsub!(/\s*(.*)\s*/, '\1') if last_name
  end
end
# codecite before_save

# codecite test contacts
# little convenience method
def puts_eval(inst, expr)
  puts "#{expr}= #{inst.instance_eval(expr)}"
end

# new contact first_name==nil is invalid
player = BaseballPlayer.new
player.valid?
puts_eval(player,"errors[:first_name]")

# verify that first_name is now valid
player.first_name = 'Stu'
player.last_name = 'Halloway'
puts_eval(player,"valid?")

# verify that save triggers the normalize_phone hook
player.first_name = ' Stu '
puts_eval(player,'first_name')
player.save!
puts_eval(player,'first_name')
# codecite test contacts

# codecite find
player_1 = BaseballPlayer.find(:first)
player_2 = BaseballPlayer.find(:first)
# codecite find

# codecite conflicting changes
player_1.batting_average = 0.367
player_2.batting_average = 0.424
player_1.save
player_2.save rescue puts "Unable to save stale object!"
# codecite conflicting changes

# codecite transaction
begin
  BaseballPlayer.transaction do
    player.first_name = nil
    player.save!
  end
rescue
  puts "Transaction failed"
end
puts("player.first_name is #{player.first_name}")
player.reload
puts("player.first_name is #{player.first_name}")
# codecite transaction

