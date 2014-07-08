class Customer < ActiveRecord::Base
    belongs_to :user
      validates :customer_email, :uniqueness => {:scope => :user_id}
      validates :customer_email, :format => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates_presence_of :user, :customer_first_name, :customer_last_name, :customer_email, :account_id
  belongs_to :account
  has_many :opportunities, through: :accounts
end
