class AddColumnUserIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :user_id, :integer
  end
end
