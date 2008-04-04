# codecite class
class Player < ActiveRecord::Base
  has_many :contracts
  has_many :teams, :through => :contracts
  # codecite class
  # codecite polymorphic
  has_many :notes, :as => :notable
  # codecite polymorphic  
end

