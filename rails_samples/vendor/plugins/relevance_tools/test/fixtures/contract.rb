class Contract < ActiveRecord::Base
  validates_presence_of :start_date
  belongs_to :inventor
end
