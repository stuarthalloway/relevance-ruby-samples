require File.dirname(__FILE__) + '/../spec_helper'

# codecite include Matchers
describe User do
  include Matchers
# codecite include Matchers
  
  # codecite create_user_function
  def create_user(options = {})
    User.create({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
  end
  # codecite create_user_function

  # codecite new user is not valid
  it "should not be valid" do
    @user = User.new
    @user.should_not be_valid
  end
  # codecite new user is not valid
  
  # codecite create_user creates a valid record
  it "create_user creates a valid record" do
    @user = create_user
    @user.should be_valid
  end
  # codecite create_user creates a valid record

  # codecite validation tests
  it "should require login" do
    @user = create_user(:login => nil)
    Set[*@user.errors[:login]].should == Set[
      "can't be blank", 
      "is too short (minimum is 3 characters)"
    ]
  end
  # codecite validation tests
  
  it "should require password" do
    @user = create_user(:password => nil)
    Set[*@user.errors[:password]].should == Set[
      "can't be blank", 
      "is too short (minimum is 4 characters)",
      "doesn't match confirmation"
    ]
  end

  it "should require password_confirmation" do
    @user = create_user(:password_confirmation => "wrong")
    Set[*@user.errors[:password]].should == Set[
      "doesn't match confirmation"
    ]
  end

  it "should require email" do
    @user = create_user(:email => nil)
    Set[*@user.errors[:email]].should == Set[
      "can't be blank", 
      "is too short (minimum is 3 characters)",
    ]
  end

  # codecite set remember_token
  # HASHED_TOKEN_RE = /^[a-f0-9]{40}$/
  it "should set remember_token to 40 hex digits for remember_me" do
    quire = create_user
    quire.remember_me
    quire.remember_token.should match(HASHED_TOKEN_RE)
    quire.should be_remember_token
  end
  # codecite set remember_token

  # codecite expire token
  it "should expire token after two weeks" do
    quire = create_user
    quire.remember_me
    next_week = Time.now + 1.week
    two_weeks_out = Time.now + 2.week
    Time.stub!(:now).and_return(next_week)
    quire.should be_remember_token
    Time.stub!(:now).and_return(two_weeks_out)
    quire.should_not be_remember_token
  end
  # codecite expire token

  
end
