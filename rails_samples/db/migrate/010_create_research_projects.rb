class CreateResearchProjects < ActiveRecord::Migration
  def self.up
    create_table :research_projects do |t|
      t.string :name, :author, :subject
      t.timestamps 
    end
  end

  def self.down
    drop_table :research_projects
  end
end
