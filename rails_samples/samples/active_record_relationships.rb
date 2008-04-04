# codecite connection
require 'rubygems'
gem 'activerecord'
require 'activerecord'
ActiveRecord::Base.establish_connection :adapter=>'mysql', 
                                        :database=>'rails_samples_development'
# codecite connection

# codecite state
class State < ActiveRecord::Base
  has_many :cities
  def to_s
    name
  end
end
# codecite state

# codecite city
class City < ActiveRecord::Base
  belongs_to :state
  def to_s
    name
  end
end
# codecite city

State.delete_all
City.delete_all

# codecite sample data
nc = State.create :name => "North Carolina"
va = State.create :name => "Virginia"
raleigh = nc.cities.create :name => "Raleigh"
durham = City.create :name => "Durham" 
nc.cities << durham
# codecite sample data

# codecite find_by_name
nc = State.find_by_name('North Carolina')
# codecite find_by_name

# codecite enumerate cities
puts "Cities in #{nc}"
nc.cities(true).each do |c|
  puts c
end
# codecite enumerate cities

# codecite capital
class State
  belongs_to :capital, 
             :class_name=>'City', 
             :foreign_key=>'capital_id'
end  
nc.capital = raleigh
nc.save
# codecite capital

# codecite print capital
puts "Capital of #{nc} is #{nc.capital}"
# codecite print capital

# codecite has_one_belongs_to
class Coach < ActiveRecord::Base
  has_one :team
end

class Team < ActiveRecord::Base
  belongs_to :coach
end
# codecite has_one_belongs_to

# codecite has_many_belongs_to
class Team < ActiveRecord::Base
  has_many :players
end

class Player < ActiveRecord::Base
  belongs_to :team
end
# codecite has_many_belongs_to

# codecite habtm
class FantasyTeam < ActiveRecord::Base
  has_and_belongs_to_many :players
end

class Player < ActiveRecord::Base
  has_and_belongs_to_many :fantasy_teams
end
# codecite habtm
