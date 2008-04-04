require File.dirname(__FILE__) + '/../spec_helper'

describe Quote do
  before(:each) do
    @quote = Quote.new
  end

  it "should be valid" do
    @quote.should be_valid
  end
end
