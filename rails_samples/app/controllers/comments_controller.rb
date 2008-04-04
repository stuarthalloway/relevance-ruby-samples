class CommentsController < ApplicationController
  # codecite index
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
  # codecite index
  
  # codecite create
  # POST /posts/#/comments
  # POST /posts/#/comments.xml
  def create
  # codecite create

    # codecite two models
    @post = Post.find(params[:post_id])
    @comment = @post.comment(params[:comment][:body], current_user)
    # codecite two models

    respond_to do |format|
      # codecite valid
      if @comment.valid?
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to post_comments_url(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
        format.js { render :nothing => true}
      else
      # codecite valid
        # codecite invalid
        @comments = @post.comments
        format.html { render :action => "index" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        # codecite invalid
      end
    end
  end
  
end
