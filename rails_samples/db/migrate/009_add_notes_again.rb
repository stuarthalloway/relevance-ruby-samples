class AddNotesAgain < ActiveRecord::Migration
  def self.up
    create_table "notes", :force => true do |t|
      t.string :body, :signed_by, :notable_type
      t.integer :notable_id
      t.timestamps
    end
  end

  def self.down
    drop_table "notes"
  end
end
