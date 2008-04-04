require File.dirname(__FILE__) + '/../controller_spec_helper'

describe CommentsController, "handling GET /post/1/courses" do
  before do
    @user = mock_model(User)
    @comment = mock_model(Comment)
    @post = mock_model(Post, :comments => [@comment])
    Post.stub!(:find).and_return(@post)
  end
  
  it "should be successful" do
    login_as @user
    get :index
    response.should be_success
    response.should render_template('index')
    assigns[:post].should == @post
    assigns[:comments].should == [@comment]
  end

end

describe CommentsController, "handling POST /posts/1/courses" do

  before do
    @user = mock_model(User)
    @comment = mock_model(Comment, :to_param => "1")
    Comment.stub!(:new).and_return(@comment)
    @post = mock_model(Post, :comment => @comment)
    Post.stub!(:find).and_return(@post)
  end
  
  it "should redirect to the index on a successful save" do
    login_as @user
    @post.should_receive(:comment).with(nil, @user).and_return(@comment)
    @comment.should_receive(:valid?).and_return(true)
    post :create, :comment => {}
    response.should redirect_to(post_comments_url(@post))
  end

  it "should re-render 'index' on failed save" do
    login_as @user
    @post.should_receive(:comments).and_return([@comment])
    @comment.should_receive(:valid?).and_return(false)
    post :create, :comment => {}
    response.should render_template('index')
  end
end
