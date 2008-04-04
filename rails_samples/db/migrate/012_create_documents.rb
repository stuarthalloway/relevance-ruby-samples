# codecite migration
class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|  
      t.string :name, :author
      t.timestamps 
    end
  end

  def self.down
    drop_table :documents
  end
end
# codecite migration