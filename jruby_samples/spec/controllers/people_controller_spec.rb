require File.dirname(__FILE__) + '/../spec_helper'

describe PeopleController, "#route_for" do

  it "should map { :controller => 'people', :action => 'index' } to /people" do
    route_for(:controller => "people", :action => "index").should == "/people"
  end
  
  it "should map { :controller => 'people', :action => 'new' } to /people/new" do
    route_for(:controller => "people", :action => "new").should == "/people/new"
  end
  
  it "should map { :controller => 'people', :action => 'show', :id => 1 } to /people/1" do
    route_for(:controller => "people", :action => "show", :id => 1).should == "/people/1"
  end
  
  it "should map { :controller => 'people', :action => 'edit', :id => 1 } to /people/1/edit" do
    route_for(:controller => "people", :action => "edit", :id => 1).should == "/people/1/edit"
  end
  
  it "should map { :controller => 'people', :action => 'update', :id => 1} to /people/1" do
    route_for(:controller => "people", :action => "update", :id => 1).should == "/people/1"
  end
  
  it "should map { :controller => 'people', :action => 'destroy', :id => 1} to /people/1" do
    route_for(:controller => "people", :action => "destroy", :id => 1).should == "/people/1"
  end
  
end

describe PeopleController, "handling GET /people" do

  before do
    @person = mock_model(Person)
    Person.stub!(:find).and_return([@person])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all people" do
    Person.should_receive(:find).with(:all).and_return([@person])
    do_get
  end
  
  it "should assign the found people for the view" do
    do_get
    assigns[:people].should == [@person]
  end
end

describe PeopleController, "handling GET /people.xml" do

  before do
    @person = mock_model(Person, :to_xml => "XML")
    Person.stub!(:find).and_return(@person)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all people" do
    Person.should_receive(:find).with(:all).and_return([@person])
    do_get
  end
  
  it "should render the found people as xml" do
    @person.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PeopleController, "handling GET /people/1" do

  before do
    @person = mock_model(Person)
    Person.stub!(:find).and_return(@person)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the person requested" do
    Person.should_receive(:find).with("1").and_return(@person)
    do_get
  end
  
  it "should assign the found person for the view" do
    do_get
    assigns[:person].should equal(@person)
  end
end

describe PeopleController, "handling GET /people/1.xml" do

  before do
    @person = mock_model(Person, :to_xml => "XML")
    Person.stub!(:find).and_return(@person)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the person requested" do
    Person.should_receive(:find).with("1").and_return(@person)
    do_get
  end
  
  it "should render the found person as xml" do
    @person.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PeopleController, "handling GET /people/new" do

  before do
    @person = mock_model(Person)
    Person.stub!(:new).and_return(@person)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new person" do
    Person.should_receive(:new).and_return(@person)
    do_get
  end
  
  it "should not save the new person" do
    @person.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new person for the view" do
    do_get
    assigns[:person].should equal(@person)
  end
end

describe PeopleController, "handling GET /people/1/edit" do

  before do
    @person = mock_model(Person)
    Person.stub!(:find).and_return(@person)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the person requested" do
    Person.should_receive(:find).and_return(@person)
    do_get
  end
  
  it "should assign the found Person for the view" do
    do_get
    assigns[:person].should equal(@person)
  end
end

describe PeopleController, "handling POST /people" do

  before do
    @person = mock_model(Person, :to_param => "1")
    Person.stub!(:new).and_return(@person)
  end
  
  def post_with_successful_save
    @person.should_receive(:save).and_return(true)
    post :create, :person => {}
  end
  
  def post_with_failed_save
    @person.should_receive(:save).and_return(false)
    post :create, :person => {}
  end
  
  it "should create a new person" do
    Person.should_receive(:new).with({}).and_return(@person)
    post_with_successful_save
  end

  it "should redirect to the new person on successful save" do
    post_with_successful_save
    response.should redirect_to(person_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe PeopleController, "handling PUT /people/1" do

  before do
    @person = mock_model(Person, :to_param => "1")
    Person.stub!(:find).and_return(@person)
  end
  
  def put_with_successful_update
    @person.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @person.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the person requested" do
    Person.should_receive(:find).with("1").and_return(@person)
    put_with_successful_update
  end

  it "should update the found person" do
    put_with_successful_update
    assigns(:person).should equal(@person)
  end

  it "should assign the found person for the view" do
    put_with_successful_update
    assigns(:person).should equal(@person)
  end

  it "should redirect to the person on successful update" do
    put_with_successful_update
    response.should redirect_to(person_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe PeopleController, "handling DELETE /people/1" do

  before do
    @person = mock_model(Person, :destroy => true)
    Person.stub!(:find).and_return(@person)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the person requested" do
    Person.should_receive(:find).with("1").and_return(@person)
    do_delete
  end
  
  it "should call destroy on the found person" do
    @person.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the people list" do
    do_delete
    response.should redirect_to(people_url)
  end
end
