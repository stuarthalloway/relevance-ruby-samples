# codecite class
require File.dirname(__FILE__) + '/../test_helper'

class NoteTest < Test::Unit::TestCase
  fixtures :players, :teams

  def test_can_apply_to_player_or_team
    player = players(:manny)
    team = teams(:redsox)
    note = Note.create!(:body => "test note", :notable => player)
    assert_equal Player, note.notable.class
    assert_equal "Player", note.attributes["notable_type"]
  
    note.notable = team
    note.save!
    assert_equal Team, note.notable.class
    assert_equal "Team", note.attributes["notable_type"]
  end
  
end
# codecite class