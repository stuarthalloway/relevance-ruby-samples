# codecite test
require 'test/unit'

require 'rubygems'
gem 'activerecord', '>= 1.15.4.7794'
require 'active_record'

require "#{File.dirname(__FILE__)}/../init"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")

def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table "notes", :force => true do |t|
      t.string :body, :signed_by, :notable_type
      t.integer :notable_id
      t.timestamps
    end
    
    create_table "research_projects" do |t|
      t.string :name, :author, :subject
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class ResearchProject < ActiveRecord::Base
  acts_as_notable
end

class Note < ActiveRecord::Base
  belongs_to :notable, :polymorphic => true
  
  def to_s  
    self.body
  end
  
  def to_signed
    "#{self.body} (#{self.signed_by})"
  end
end


class ActsAsNotableTest < Test::Unit::TestCase
  def setup
    setup_db
    @rp = ResearchProject.new
  end
  def teardown
    teardown_db
  end
  
  def test_objects_have_empty_notes_upon_create
    assert_equal "", @rp.all_notes
    assert_equal 0, @rp.notes.count
    assert_nil @rp.last_note
  end
  
  def test_can_add_anonymous_note
    @rp.save
    @rp.note("Anonymous note")
    assert_equal 1, @rp.notes.count
    note = @rp.notes.detect {|note| note.body == 'Anonymous note'}
    assert note
    assert_equal "Anonymous Coward", note.signed_by
  end
  
  def test_can_add_signed_note
    @rp.save
    @rp.note("Signed note", :signed_by => "CmdrTaco")
    assert_equal 1, @rp.notes.count
    note = @rp.notes.detect {|note| note.body == 'Signed note'}
    assert note
    assert_equal "CmdrTaco", note.signed_by
  end
  
  def test_can_retrieve_last_note
    @rp.save
    @rp.note("Signed note", :signed_by => "CmdrTaco")
    sleep 1
    @rp.note("Another note")
    sleep 1
    @rp.note("Last note")
    
    note = @rp.last_note
    assert_equal "Last note", note.body
  end
  
  def test_can_get_text_list_of_notes
    @rp.save
    @rp.note("Signed note", :signed_by => "CmdrTaco")
    sleep 1
    @rp.note("Another note")
    sleep 1
    @rp.note("Last note")
    
    expected = "Signed note (CmdrTaco)\nAnother note (Anonymous Coward)\nLast note (Anonymous Coward)\n"
    assert_equal expected, @rp.all_notes
  end

end
# codecite test

