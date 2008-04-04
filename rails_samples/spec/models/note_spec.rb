# codecite class
require File.dirname(__FILE__) + '/../spec_helper'

describe Note do
  fixtures :players, :teams
  
  it "should be able to apply to Player or Team" do
    player = players(:manny)
    team = teams(:redsox)
    note = Note.create!(:body => "test note", :notable => player)
    note.notable.class.should == Player
    note.attributes["notable_type"].should == "Player"
  
    note.notable = team
    note.save!
    note.notable.class.should == Team
    note.attributes["notable_type"].should == "Team"
  end
  
end
# codecite class