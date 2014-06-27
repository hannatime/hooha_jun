class Opportunity < ActiveRecord::Base
    validates_presence_of :opportunity_name, :opportunity_account_name, :opportunity_owner

end
