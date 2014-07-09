class AddAccountIdToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :account_id, :integer
    add_column :opportunities, :customer_id, :integer

  end
end
