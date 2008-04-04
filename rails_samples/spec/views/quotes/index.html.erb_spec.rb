require File.dirname(__FILE__) + '/../../spec_helper'

describe "/quotes/index.html.erb" do
  include QuotesHelper
  
  before do
    quote_98 = mock_model(Quote, :body => "Quote 98", :source => "spec")
    quote_99 = mock_model(Quote, :body => "Quote 99", :source => "spec")

    assigns[:quotes] = [quote_98, quote_99]
  end

  it "should render list of quotes" do
    render "/quotes/index.html.erb"
  end
end

