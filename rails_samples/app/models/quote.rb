class Quote < ActiveRecord::Base
  def calculate
    self.transaction do
      source = "transactionally calculated"
      body = "transactionally calculated"
      save!
    end
  end
end
