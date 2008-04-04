class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title, :year
      t.timestamps 
    end
  end

  def self.down
    drop_table :movies
  end
end
