class Opportunity < ActiveRecord::Base
    belongs_to :user
    belongs_to :account
    has_and_belongs_to_many :customers
    has_many :tasks, dependent: :destroy  
    validates_presence_of :user, :opportunity_name
    paginates_per 10
    
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |opportunity|
          csv << opportunity.attributes.values_at(*column_names)
        end
      end
    end
    
end
