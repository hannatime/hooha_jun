class Account < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :account_name, :account_phone
  validates :account_name, :uniqueness => {:scope => :user_id}


  has_many :opportunities, dependent: :destroy 
  has_many :customers, dependent: :destroy  
end


