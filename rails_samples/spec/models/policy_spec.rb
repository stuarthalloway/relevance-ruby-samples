require File.dirname(__FILE__) + '/../spec_helper'

describe Policy do
  # codecite properties
  it "should properly alias its local properties" do
    p = Policy.new
    p.polTYPE = "TEST"
    p.polNUMBER = 1
    p.policy_type.should == "TEST"
    p.policy_number.should == 1
  end
  # codecite properties
  # codecite relationship  
  it "should have a relationship to a Member" do
    p = Policy.create
    m = Member.create :first_name => 'Bob', :last_name => "Smith"
    p.policy_holder = m
    p.save!
    p = Policy.find(:first)
    p.policy_holder.should == m
  end
  # codecite relationship
  # codecite keys
  it "should have propertly redefined its primary_key and table_name" do
    Policy.table_name.should == "hrPOL001"
    Policy.primary_key.should == "polID"
  end
  # codecite keys
end
