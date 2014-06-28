class Task < ActiveRecord::Base

    validates_presence_of :task_type, :task_name, :task_assigned_to, :task_due_date, :task_comments

end
