# codecite class
require File.dirname(__FILE__) + '/../spec_helper'

describe ResearchProject do

  it "should have no notes upon creation" do
    rp = ResearchProject.new
    assert_equal "", rp.all_notes
    assert_equal 0, rp.notes.count
    assert_nil rp.last_note
  end
  
  it "should be able to accept an anonymous note" do
    rp = ResearchProject.create
    rp.note("Anonymous note")
    assert_equal 1, rp.notes.count
    note = rp.notes.detect {|note| note.body == 'Anonymous note'}
    assert note
    assert_equal "Anonymous Coward", note.signed_by
  end
  
  it "should be able to accept a signed note" do
    rp = ResearchProject.create
    rp.note("Signed note", :signed_by => "CmdrTaco")
    assert_equal 1, rp.notes.count
    note = rp.notes.detect {|note| note.body == 'Signed note'}
    assert note
    assert_equal "CmdrTaco", note.signed_by
  end
  
  it "should be able to retrieve the last note" do
    rp = ResearchProject.create
    rp.note("Signed note", :signed_by => "CmdrTaco")
    sleep 1
    rp.note("Another note")
    sleep 1
    rp.note("Last note")
    
    note = rp.last_note
    assert_equal "Last note", note.body
  end
  
  it "should be able to retrieve a text representation of all notes" do
    rp = ResearchProject.create
    rp.note("Signed note", :signed_by => "CmdrTaco")
    sleep 1
    rp.note("Another note")
    sleep 1
    rp.note("Last note")
    
    expected = "Signed note (CmdrTaco)\nAnother note (Anonymous Coward)\nLast note (Anonymous Coward)\n"
    assert_equal expected, rp.all_notes
  end
  
end
# codecite class