class Account < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :account_name, :account_phone
  validates :account_name, uniqueness: true

  has_many :opportunities
end
