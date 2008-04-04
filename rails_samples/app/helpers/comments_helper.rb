module CommentsHelper

  # codecite helper_example
  def display_name
    if @comment.author
      @comment.author
    else
      "Anonymous Coward"
    end
  end
  # codecite helper_example
  
end
