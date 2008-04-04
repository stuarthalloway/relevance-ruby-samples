# codecite class
require File.dirname(__FILE__) + '/../test_helper'

class TeamTest < Test::Unit::TestCase
  fixtures :players, :teams, :contracts
  # codecite class

  def test_can_create_new_contract
    t = Team.create
    # no fixtures for contracts
    assert_equal [], t.contracts
    assert_equal [], t.players
    
    contract = t.contracts.create!(:player => players(:manny), :length => 5, :salary => 17000000)

    # remember that you have to reload the collections first
    assert_equal [contract], t.contracts(true)
    assert_equal [players(:manny)], t.players(true)
  end
  
  # codecite test
  def test_can_calculate_total_payroll
    t = Team.create
    assert_equal 0, t.players.payroll
    
    t.contracts.create!(:player => players(:manny), :length => 5, :salary => 17000000)
    t.contracts.create!(:player => players(:beckett), :length => 5, :salary => 14000000)

    assert_equal 31000000, t.players.payroll
  end
  # codecite test
  
  # codecite note test
  def test_can_accept_multiple_notes
    t = Team.create
    assert_equal [], t.notes
    note1 = Note.create!(:body => "note 1")
    note2 = Note.create!(:body => "note 2")
    t.notes << note1
    t.notes << note2
    assert_equal [note1, note2], t.notes
  end
  # codecite note test

end
