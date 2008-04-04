require File.dirname(__FILE__) + '/../../spec_helper'

describe "/quotes/new.html.erb" do
  include QuotesHelper
  
  before do
    @quote = mock_model(Quote)
    @quote.stub!(:new_record?).and_return(true)
    assigns[:quote] = @quote
  end

  it "should render new form" do
    render "/quotes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", quotes_path) do
    end
  end
end


