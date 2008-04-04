class AddHomeRunsToBaseballPlayer < ActiveRecord::Migration
  # codecite self.up
  def self.up
    add_column :baseball_players, :home_runs, :integer
  end
  # codecite self.up

  # codecite self.down
  def self.down
    remove_column :baseball_players, :home_runs
  end
  # codecite self.down
end
