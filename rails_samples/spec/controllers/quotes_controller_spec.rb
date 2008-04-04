require File.dirname(__FILE__) + '/../spec_helper'

describe QuotesController, "#route_for" do

  it "should map { :controller => 'quotes', :action => 'index' } to /quotes" do
    route_for(:controller => "quotes", :action => "index").should == "/quotes"
  end
  
  it "should map { :controller => 'quotes', :action => 'new' } to /quotes/new" do
    route_for(:controller => "quotes", :action => "new").should == "/quotes/new"
  end
  
  it "should map { :controller => 'quotes', :action => 'show', :id => 1 } to /quotes/1" do
    route_for(:controller => "quotes", :action => "show", :id => 1).should == "/quotes/1"
  end
  
  it "should map { :controller => 'quotes', :action => 'edit', :id => 1 } to /quotes/1/edit" do
    route_for(:controller => "quotes", :action => "edit", :id => 1).should == "/quotes/1/edit"
  end
  
  it "should map { :controller => 'quotes', :action => 'update', :id => 1} to /quotes/1" do
    route_for(:controller => "quotes", :action => "update", :id => 1).should == "/quotes/1"
  end
  
  it "should map { :controller => 'quotes', :action => 'destroy', :id => 1} to /quotes/1" do
    route_for(:controller => "quotes", :action => "destroy", :id => 1).should == "/quotes/1"
  end
  
end

describe QuotesController, "handling GET /quotes" do

  before do
    @quote = mock_model(Quote)
    Quote.stub!(:find).and_return([@quote])
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
  
  it "should find all quotes" do
    Quote.should_receive(:find).with(:all).and_return([@quote])
    do_get
  end
  
  it "should assign the found quotes for the view" do
    do_get
    assigns[:quotes].should == [@quote]
  end
end

describe QuotesController, "handling GET /quotes.xml" do

  before do
    @quote = mock_model(Quote, :to_xml => "XML")
    Quote.stub!(:find).and_return(@quote)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all quotes" do
    Quote.should_receive(:find).with(:all).and_return([@quote])
    do_get
  end
  
  it "should render the found quotes as xml" do
    @quote.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QuotesController, "handling GET /quotes/1" do

  before do
    @quote = mock_model(Quote)
    Quote.stub!(:find).and_return(@quote)
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
  
  it "should find the quote requested" do
    Quote.should_receive(:find).with("1").and_return(@quote)
    do_get
  end
  
  it "should assign the found quote for the view" do
    do_get
    assigns[:quote].should equal(@quote)
  end
end

describe QuotesController, "handling GET /quotes/1.xml" do

  before do
    @quote = mock_model(Quote, :to_xml => "XML")
    Quote.stub!(:find).and_return(@quote)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the quote requested" do
    Quote.should_receive(:find).with("1").and_return(@quote)
    do_get
  end
  
  it "should render the found quote as xml" do
    @quote.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QuotesController, "handling GET /quotes/new" do

  before do
    @quote = mock_model(Quote)
    Quote.stub!(:new).and_return(@quote)
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
  
  it "should create an new quote" do
    Quote.should_receive(:new).and_return(@quote)
    do_get
  end
  
  it "should not save the new quote" do
    @quote.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new quote for the view" do
    do_get
    assigns[:quote].should equal(@quote)
  end
end

describe QuotesController, "handling GET /quotes/1/edit" do

  before do
    @quote = mock_model(Quote)
    Quote.stub!(:find).and_return(@quote)
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
  
  it "should find the quote requested" do
    Quote.should_receive(:find).and_return(@quote)
    do_get
  end
  
  it "should assign the found Quote for the view" do
    do_get
    assigns[:quote].should equal(@quote)
  end
end

describe QuotesController, "handling POST /quotes" do

  before do
    @quote = mock_model(Quote, :to_param => "1")
    Quote.stub!(:new).and_return(@quote)
  end
  
  def post_with_successful_save
    @quote.should_receive(:save).and_return(true)
    post :create, :quote => {}
  end
  
  def post_with_failed_save
    @quote.should_receive(:save).and_return(false)
    post :create, :quote => {}
  end
  
  it "should create a new quote" do
    Quote.should_receive(:new).with({}).and_return(@quote)
    post_with_successful_save
  end

  it "should redirect to the new quote on successful save" do
    post_with_successful_save
    response.should redirect_to(quote_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe QuotesController, "handling PUT /quotes/1" do

  before do
    @quote = mock_model(Quote, :to_param => "1")
    Quote.stub!(:find).and_return(@quote)
  end
  
  def put_with_successful_update
    @quote.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @quote.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the quote requested" do
    Quote.should_receive(:find).with("1").and_return(@quote)
    put_with_successful_update
  end

  it "should update the found quote" do
    put_with_successful_update
    assigns(:quote).should equal(@quote)
  end

  it "should assign the found quote for the view" do
    put_with_successful_update
    assigns(:quote).should equal(@quote)
  end

  it "should redirect to the quote on successful update" do
    put_with_successful_update
    response.should redirect_to(quote_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe QuotesController, "handling DELETE /quotes/1" do

  before do
    @quote = mock_model(Quote, :destroy => true)
    Quote.stub!(:find).and_return(@quote)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the quote requested" do
    Quote.should_receive(:find).with("1").and_return(@quote)
    do_delete
  end
  
  it "should call destroy on the found quote" do
    @quote.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the quotes list" do
    do_delete
    response.should redirect_to(quotes_url)
  end
end
