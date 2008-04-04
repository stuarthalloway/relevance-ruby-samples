require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
  fixtures :users

  # codecite redirect after successful login
  it "should redirect after successful login" do
    post :login, :login => 'quentin', :password => 'test'
    session[:user].should == users(:quentin).id
    response.should redirect_to(:action => :index)
  end
  # codecite redirect after successful login

  # codecite render login page after failed login
  it "should render login page again after failed login" do
    post :login, :login => 'quentin', :password => 'bad password'
    session[:user].should == nil
    response.should render_template("login")
  end
  # codecite render login page after failed login

  # codecite should set a flash message on failed login
  it "should set flash message on failed login" do
    post :login, :login => 'quentin', :password => 'bad password'
    flash[:notice].should == 'Incorrect username/password combination'
  end
  # codecite should set a flash message on failed login

  # codecite remember me
  # HASHED_TOKEN_RE = /^[a-f0-9]{40}$/
  it "should be able to remember me" do
    post :login, :login => 'quentin', :password => 'test', :remember_me => "1"
    response.cookies["auth_token"].first.should match(HASHED_TOKEN_RE)
  end

  it "should be able to *not* remember me" do
    post :login, :login => 'quentin', :password => 'test', :remember_me => "0"
    response.cookies["auth_token"].should == nil
  end
  # codecite remember me
  
end
