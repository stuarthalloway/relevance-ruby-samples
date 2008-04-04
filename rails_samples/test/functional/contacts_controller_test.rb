require File.dirname(__FILE__) + '/../test_helper'
require 'contacts_controller'

class ContactsController; def rescue_action(e) raise e end; end

describe "Contacts Controller", ActionController::TestCase do
  tests ContactsController
  fixtures :contacts

  it "get index" do
    get :index
    status.should.be :success
    assigns(:contacts).should.not.be nil
  end

  it "get new" do
    get :new
    status.should.be :success
  end

  #codecite test_should_create_contact
  def test_should_create_contact
    assert_difference(Contact, :count, 1) do
      post :create, :contact => { :first_name => "John", :last_name => "Doe"}
    end

    assert_redirected_to contact_path(assigns(:contact))
  end
  #codecite test_should_create_contact

  #codecite test_should_not_create_invalid_contact
  def test_should_not_create_invalid_contact
    assert_difference(Contact, :count, 0) do
      post :create, :contact => { }
    end

    assert_response :success
    assert_template "new"
  end
  #codecite test_should_not_create_invalid_contact
  

  def test_should_show_contact
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_contact
    put :update, :id => 1, :contact => { }
    assert_redirected_to contact_path(assigns(:contact))
  end

  def test_should_destroy_contact
    assert_difference(Contact, :count, -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to contacts_path
  end
end
