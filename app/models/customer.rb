class Customer < ActiveRecord::Base
    validates :customer_email, uniqueness: true,
                    format: { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, 
                    message: 'Invalid e-mail address' }
  validates_presence_of :customer_first_name, :customer_last_name, :customer_email

end