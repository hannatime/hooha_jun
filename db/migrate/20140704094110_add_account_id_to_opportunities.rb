class AddAccountIdToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :account_id, :integer, :default => 1
  end
end
