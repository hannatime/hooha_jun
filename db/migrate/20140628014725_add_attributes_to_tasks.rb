class AddAttributesToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_name, :string
    add_column :tasks, :task_due_date, :date
    add_column :tasks, :task_type, :string
    add_column :tasks, :task_comments, :string
  end
end
