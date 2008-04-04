# codecite class
require File.dirname(__FILE__) + '/../spec_helper'

describe Team do
  fixtures :players, :teams, :contracts
  # codecite class
  
  it "should be able to create a new contract" do
    t = Team.create
    # no fixtures for contracts
    t.contracts.should == []
    t.players.should == []
    
    contract = t.contracts.create!(:player => players(:manny), :length => 5, :salary => 17000000)

    t.contracts(true).should == [contract]
    # remember that you have to reload the players collection first
    t.players(true).should == [players(:manny)]
  end
  
  # codecite test
  it "should be able to calculate total payroll" do
    t = Team.create
    t.players.payroll.should == 0
    
    t.contracts.create!(:player => players(:manny), :length => 5, :salary => 17000000)
    t.contracts.create!(:player => players(:beckett), :length => 5, :salary => 14000000)
    
    t.players.payroll.should == 31000000    
  end
  # codecite test
  
  # codecite note test
  it "should be able to accept multiple notes" do
    t = Team.create
    t.notes.should == []
    note1 = Note.create!(:body => "note 1")
    note2 = Note.create!(:body => "note 2")
    t.notes << note1
    t.notes << note2
    t.notes.should == [note1, note2]
  end
  # codecite note test

end
