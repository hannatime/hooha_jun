class Task < ActiveRecord::Base

    belongs_to :user
    belongs_to :opportunity
    validates_presence_of :user, :task_name, :task_status, :task_due_date, :opportunity_id
    
        def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |task|
          csv << task.attributes.values_at(*column_names)
        end
      end
    end

end
