# codecite migration
class CreateChanges < ActiveRecord::Migration
  def self.up
    create_table :changes do |t|
      t.string :name, :description, :author
      t.integer :document_id
      t.timestamps 
    end
  end

  def self.down
    drop_table :changes
  end
end
# codecite migration