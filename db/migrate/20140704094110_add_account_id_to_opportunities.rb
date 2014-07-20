class AddAccountIdToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :account_id, :integer
  end
end
