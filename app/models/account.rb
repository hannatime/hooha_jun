class Account < ActiveRecord::Base

  validates_presence_of :account_name, :account_phone
  validates :account_name, uniqueness: true
end
