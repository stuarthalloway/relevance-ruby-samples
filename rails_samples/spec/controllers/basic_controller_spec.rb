require File.dirname(__FILE__) + '/../spec_helper'

describe BasicController do

  it "should expose index to all" do
    get :index
    response.should be_success
    response.body.should == "visible to all"
  end
  
  it "should secure secret with basic auth" do
    get :secret
    puts response.code.should == "401"
  end
  
  # may be non trivial, see http://railsforum.com/viewtopic.php?pid=42118
  it "should allow basic auth to secret"

end
