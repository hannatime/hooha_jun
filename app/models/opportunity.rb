class Opportunity < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :user, :opportunity_name
    belongs_to :account
    has_many :customers, through: :accounts
end
