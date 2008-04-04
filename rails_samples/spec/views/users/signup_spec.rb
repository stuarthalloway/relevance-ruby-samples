# codecite describe
require File.dirname(__FILE__) + '/../../spec_helper'

describe '/users/signup' do
# codecite describe
  
  # codecite signup form
  it "should display a signup form" do
    render '/users/signup'
    response.should have_tag('form') do
      with_tag "input#user_login[type=text][name=?]", "user[login]"
      with_tag "input#user_email[type=text][name=?]", "user[email]"
      with_tag "input#user_password[type=password][name=?]", "user[password]"
      with_tag "input#user_password_confirmation[type=password][name=?]", "user[password_confirmation]"
    end
  end
  # codecite signup form

  # codecite form values
  it "should display values for user object" do
    user = mock_model(User, :login=>'fred', 
                            :email=>'contact@thinkrelevance.com',
                            :password=>'secret',
                            :password_confirmation=>'secret')
    assigns[:user] = user
    render '/users/signup'
    response.should have_tag('form') do
      with_tag "input#user_login[value=fred]"
      with_tag "input#user_email[value=contact@thinkrelevance.com]"
      with_tag "input#user_password[value=secret]"
      with_tag "input#user_password_confirmation[value=secret]"
      with_tag "input[value=Sign up]"
    end
  end
  # codecite form values

end
