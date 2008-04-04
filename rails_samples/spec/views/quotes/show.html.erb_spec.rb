require File.dirname(__FILE__) + '/../../spec_helper'

describe "/quotes/show.html.erb" do
  include QuotesHelper
  
  before do
    @quote = mock_model(Quote, :body => "A Quote", :source => "spec")

    assigns[:quote] = @quote
  end

  it "should render attributes in <p>" do
    render "/quotes/show.html.erb"
  end
end

