class Task < ActiveRecord::Base

    belongs_to :user
    belongs_to :opportunity
    validates_presence_of :user,:task_type, :task_name, :task_due_date
    
        def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |task|
          csv << task.attributes.values_at(*column_names)
        end
      end
    end

end
