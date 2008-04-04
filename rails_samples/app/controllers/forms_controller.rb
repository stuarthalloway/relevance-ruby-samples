class FormsController < ApplicationController
  def simple
    @post = Post.new
  end
  
  def labelled_field
    @post = Post.new
  end
  
  def voldemort
    raise NameError
  end
  
  rescue_from NameError, :with => :nameless
  def nameless
    render :text => "He who must not be named"
  end
end
