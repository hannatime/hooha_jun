class Opportunity < ActiveRecord::Base
    validates_presence_of :opportunity_name, :account_name, :owner

end
