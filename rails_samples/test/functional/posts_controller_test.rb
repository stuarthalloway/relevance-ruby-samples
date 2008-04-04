require File.dirname(__FILE__) + '/../test_helper'
require 'posts_controller'

class PostsController; def rescue_action(e) raise e end; end

describe "Posts Controller", ActionController::TestCase do
  tests PostsController
  fixtures :posts, :users, :comments
  
  before do
    login_as :quentin
  end

  # codecite test_should_get_index
  def test_should_get_index
    get :index
    assert_response :success
    assert_template "index"
    assert_select "h1", "Listing posts"
    assert_equal Post.find(:all), assigns(:posts)
  end
  # codecite test_should_get_index

  # codecite test_should_get_new
  def test_should_get_new
    get :new
    assert_response :success
    assert_template "new"
    assert_select "h1", "New post"
    assert_select "form" do
      assert_select("input[type=text][id=post_title]")
      assert_select("textarea[id=post_body]")
      assert_select("input[type=checkbox][id=post_published]")
      assert_select("input[type=submit][id=post_submit][value=Create]")
    end
  end
  # codecite test_should_get_new

  # codecite test_should_create_post
  def test_should_create_post
    Post.any_instance.stubs(:save).returns(true)
    Post.any_instance.stubs(:id).returns(1)
    Post.any_instance.stubs(:to_param).returns("1")
    Post.any_instance.stubs(:new_record?).returns(false)
    post :create, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end
  # codecite test_should_create_post

  # codecite test_should_not_create_invalid_post
  def test_should_not_create_invalid_post
    Post.any_instance.stubs(:save).returns(false)
    post :create, :post => { }
    assert_response :success
  end
  # codecite test_should_not_create_invalid_post
  
  # codecite test_should_show_post
  def test_should_show_post
    get :show, :id => 1
    assert_response :success
    assert_equal posts(:one), assigns(:post)
    assert_equal [comments(:one), comments(:two)], assigns(:comments)
  end
  # codecite test_should_show_post

  # codecite test_should_get_edit
  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
    assert_select "h1", "Editing post"
    assert_select "form" do
      assert_select("input[type=text][id=post_title][value=?]", "MyString")
      assert_select("textarea[id=post_body]", "MyText")
    end
  end
  # codecite test_should_get_edit

  def test_should_update_post
    put :update, :id => 1, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end

  # codecite test_should_not_update_invalid_post
  def test_should_not_update_invalid_post
    Post.any_instance.stubs(:update_attributes).returns(false)
    put :update, :id => 1, :post => { }
    assert_response :success
  end
  # codecite test_should_not_update_invalid_post
  
  def test_should_destroy_post
    assert_difference(Post, :count, -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to posts_path
  end
end
