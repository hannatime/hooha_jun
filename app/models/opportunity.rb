class Opportunity < ActiveRecord::Base
    belongs_to :user
    belongs_to :account
    has_many :customers, through: :accounts
    has_many :tasks, dependent: :destroy  
    validates_presence_of :user, :opportunity_name
    paginates_per 10
end
