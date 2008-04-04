module Commentable
  def self.included(target)
    target.has_many :comments, :as => :commentable
  end
  
  def comment(text, user)
    comment = self.comments.new(:body => text, :user => user)
    comment.save
    comment
  end
end
