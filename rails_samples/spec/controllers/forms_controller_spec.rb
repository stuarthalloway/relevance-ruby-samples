require File.dirname(__FILE__) + '/../controller_spec_helper'

describe FormsController do
  
  before do
    @user = mock_model(User)
    login_as @user
  end
  
  it "should render nameless for voldemort" do
    get :voldemort
    response.body.should == "He who must not be named"
  end
  

end
