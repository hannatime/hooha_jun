class AddAccountIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :account_id, :integer
    add_column :customers, :opportunity_id, :integer
  end
end
