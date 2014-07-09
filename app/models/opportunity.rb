class Opportunity < ActiveRecord::Base
    belongs_to :user
    belongs_to :account
    has_many :customers, through: :accounts
    
    validates_presence_of :user, :opportunity_name
    
end
