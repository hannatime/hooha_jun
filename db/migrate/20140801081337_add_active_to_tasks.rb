class AddActiveToTasks < ActiveRecord::Migration
  def change
        add_column :tasks, :task_active, :string
  end
end
