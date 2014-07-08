class AddAccountIdToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :account_id, :integer, :default => 1
    add_column :opportunities, :customer_id, :integer, :default => 1

  end
end
