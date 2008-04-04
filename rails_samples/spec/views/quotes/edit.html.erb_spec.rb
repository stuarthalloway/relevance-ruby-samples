require File.dirname(__FILE__) + '/../../spec_helper'

describe "/quotes/edit.html.erb" do
  include QuotesHelper
  
  before do
    @quote = mock_model(Quote)
    assigns[:quote] = @quote
  end

  it "should render edit form" do
    render "/quotes/edit.html.erb"
    
    response.should have_tag("form[action=#{quote_path(@quote)}][method=post]") do
    end
  end
end


