require File.dirname(__FILE__) + '/../test_helper'
require "widgets_controller"

class WidgetsController; def rescue_action(e) raise e end; end

describe "Widgets Controller", ActionController::TestCase do
  tests WidgetsController
  fixtures :widgets

  before do
    # overriding require_login so that each test does not have to
    # mocks provide a better way, see PostsControllerTest.
    class <<@controller
      def require_login
        true
      end
    end
  end

  it "get index" do
    get :index
    status.should.be :success
    assigns(:widgets).should.not.be nil
  end

  it "get new" do
    get :new
    status.should.be :success
  end

  it "create widget" do
    assert_difference(Widget, :count, 1) do
      post :create, :widget => {:name => "test", :color => "red" }
    end

    assert_redirected_to widgets_path
  end

  it "show widget" do
    get :show, :id => 1
    status.should.be :success
  end

  it "get edit" do
    get :edit, :id => 1
    status.should.be :success
  end

  it "update widget" do
    put :update, :id => 1, :widget => {:name => "test", :color => "red" }
    response.should.redirected widgets_path
  end

  it "destroy widget" do
    assert_difference(Widget, :count, -1) do
      delete :destroy, :id => 1
    end

    response.should.redirected widgets_path
  end
end
