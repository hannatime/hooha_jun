class Opportunity < ActiveRecord::Base
    
    belongs_to :user
    validates_presence_of :user, :opportunity_name, :opportunity_account_name, :opportunity_owner

end
