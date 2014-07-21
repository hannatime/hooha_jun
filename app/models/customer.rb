class Customer < ActiveRecord::Base
    belongs_to :user
      validates :customer_email, :uniqueness => {:scope => :user_id}

  validates_presence_of :user, :customer_first_name, :customer_last_name, :account_id
  belongs_to :account
  has_and_belongs_to_many :opportunities

     def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |customer|
          csv << customer.attributes.values_at(*column_names)
        end
      end
    end
end
