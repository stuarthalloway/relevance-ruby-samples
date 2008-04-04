# codecite class
require File.dirname(__FILE__) + '/../spec_helper'

describe Player do
  # codecite class
  # codecite fixtures
  fixtures :players, :teams, :contracts
  # codecite fixtures
  
  # codecite test
  it "should be able to create a new contract" do
    p = Player.create
    p.contracts.should == []
    p.teams.should == []
    
    contract = p.contracts.create!(:team => teams(:redsox), :salary => 5000000, :length => 5)
    
    p.contracts(true).should == [contract]
    # remember to reload the association
    p.teams(true).should == [teams(:redsox)]
  end
  # codecite test
  
  # codecite note test
  it "should be able to accept multiple notes" do
    p = players(:manny)
    p.notes.should == []
    note1 = Note.create!(:body => "note 1")
    note2 = Note.create!(:body => "note 2")
    p.notes << note1
    p.notes << note2
    p.notes.should == [note1, note2]
  end
  # codecite note test

end
