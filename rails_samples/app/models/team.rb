# codecite class
class Team < ActiveRecord::Base
  has_many :contracts
  # codecite class
  # codecite extension
  has_many :players, :through => :contracts do
    def payroll
      count > 0 ? sum(:salary).to_i : 0
    end
  end
  # codecite extension
  
  # codecite polymorphic
  has_many :notes, :as => :notable
  # codecite polymorphic
end
