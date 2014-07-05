class Task < ActiveRecord::Base

    belongs_to :user
    validates_presence_of :user,:task_type, :task_name, :task_due_date
    
end
