require File.dirname(__FILE__) + '/../spec_helper'

describe Member do
  # codecite collection
  it "should have a collection of Policies" do
    m = Member.create
    p1 = Policy.create :policy_number => 1
    p2 = Policy.create :policy_number => 2
    
    m.policies << p1
    m.policies << p2
    
    m = Member.find(:first)
    m.policies.should == [p1, p2]
  end
  # codecite collection  
end