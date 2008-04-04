# codecite class
require File.dirname(__FILE__) + '/../test_helper'

class PlayerTest < Test::Unit::TestCase
  # codecite class
  # codecite fixtures
  fixtures :players, :teams, :contracts
  # codecite fixtures
  
  # codecite test
  def test_can_create_new_contract
    p = Player.create
    assert_equal [], p.contracts
    assert_equal [], p.teams
    
    contract = p.contracts.create!(:team => teams(:redsox), :salary => 5000000, :length => 5)
    
    # remember to reload the association
    assert_equal [contract], p.contracts(true)
    assert_equal [teams(:redsox)], p.teams(true)
  end
  # codecite test
  
  # codecite note test
  def test_can_accept_multiple_notes
    p = players(:manny)
    assert_equal [], p.notes
    note1 = Note.create!(:body => "note 1")
    note2 = Note.create!(:body => "note 2")
    p.notes << note1
    p.notes << note2
    assert_equal [note1, note2], p.notes
  end
  # codecite note test

end
