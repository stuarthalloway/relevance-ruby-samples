# codecite commentable
class Post < ActiveRecord::Base
  include Commentable
  # codecite commentable
  validates_presence_of :title, :body
end
