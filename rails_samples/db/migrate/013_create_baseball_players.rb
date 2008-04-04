class CreateBaseballPlayers < ActiveRecord::Migration
  # codecite self.up
  def self.up
    create_table :baseball_players do |t|
      t.string :first_name, :last_name
      t.float :batting_average
      t.timestamps
      # may someday be replaced by t.locking!
      t.integer :lock_version, :default => 0
    end
  end
  # codecite self.up

  # codecite self.down
  def self.down
    drop_table :baseball_players
  end
  # codecite self.down
end
