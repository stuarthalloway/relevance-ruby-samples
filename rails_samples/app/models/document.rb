# codecite class
class Document < ActiveRecord::Base
  has_many :changes, :order => 'created_at DESC'
end
# codecite class