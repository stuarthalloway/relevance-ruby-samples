# codecite migration
class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :player_id, :team_id, :salary, :length
      t.timestamps 
    end
  end

  def self.down
    drop_table :contracts
  end
end
# codecite migration