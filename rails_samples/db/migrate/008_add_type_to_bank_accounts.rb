# codecite migration
class AddTypeToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :type, :string
    add_column :bank_accounts, :rate, :float
  end

  def self.down
    remove_column :bank_accounts, :type
    remove_column :bank_accounts, :rate
  end
end
# codecite migration