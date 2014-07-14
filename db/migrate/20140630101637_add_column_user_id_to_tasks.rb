class AddColumnUserIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :opportunity_id, :integer
  end
end
