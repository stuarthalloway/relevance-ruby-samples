require File.join(File.dirname(__FILE__), "/../../test_helper")

describe "Contacts Controller Routes", ActionController::TestCase do
  tests ContactsController
  
  it "Routes the sample static route to the index action" do
    {:path => "any/path/can/be/a/route", :method => :get}.should.route_from :controller => "contacts", :action => "special"
  end

  it "Routes contact extras" do
    {:path => "contacts/extra/foo", :method => :get}.should.route_from :controller => "contacts", :action => "extra", :id => "foo"
  end
  
  it "Named route people links to index action" do
    {:path => "people", :method => :get}.should.route_from :controller => "contacts", :action => "index"
  end

  it "Is a restful resource" do
    {:path => "contacts", :method => :post}.should.route_from :controller => "contacts", :action => "create"
  end
  
end
