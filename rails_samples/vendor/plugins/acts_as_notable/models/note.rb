# codecite class
class Note < ActiveRecord::Base
  belongs_to :notable, :polymorphic => true
  
  def to_signed
    "#{self.body} (#{self.signed_by})"
  end
end
# codecite class