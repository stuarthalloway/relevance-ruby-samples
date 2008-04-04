# codecite describe
require File.dirname(__FILE__) + '/../../spec_helper'

describe '/users/login' do
# ...
# codecite describe
  
  # codecite should display a login and password form
  it "should display a login and password form" do
    render '/users/login'
    response.should_not have_tag('p[class=notice]')
    response.should have_tag('form') do
      with_tag "input#login[type=text]"
      with_tag "input#password[type=password]"
    end
  end
  # codecite should display a login and password form

  # codecite should display the flash message
  it "should display a paragraph with class 'notice' if flash has been set" do
    flash[:notice] = '**notice**'
    render '/users/login'
    response.should have_tag('p[class=notice]', '**notice**')
  end
  # codecite should display the flash message


end
