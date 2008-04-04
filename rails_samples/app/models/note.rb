# codecite class
class Note < ActiveRecord::Base
  belongs_to :notable, :polymorphic => true
# codecite class  
  
  def to_s  
    self.body
  end
  
  def to_signed
    "#{self.body} (#{self.signed_by})"
  end
  
end
