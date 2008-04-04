require File.dirname(__FILE__) + '/../spec_helper'

describe "The Jabberwock post" do
  fixtures :posts, :comments
  before do
    @tdn = posts(:jabberwock)
  end
  
  it "has two comments" do
    @tdn.comments.should == [comments(:one), comments(:two)]
  end
end
