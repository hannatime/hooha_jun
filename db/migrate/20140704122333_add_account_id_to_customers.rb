class AddAccountIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :account_id, :integer, :default => 1
    add_column :customers, :opportunity_id, :integer, :default => 1
  end
end
