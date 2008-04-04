require File.join(File.dirname(__FILE__), "/../test_helper")

describe "Quote calculations" do
  it "transactionally saves the content and marks as such" do
    quote = Quote.new
    quote.expects(:save!)
    quote.calculate
  end
end
