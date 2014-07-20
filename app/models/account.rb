class Account < ActiveRecord::Base
  belongs_to :user
  has_many :opportunities, dependent: :destroy 
  has_many :customers, dependent: :destroy  

  validates_presence_of :user, :account_name, :account_phone
  validates :account_name, :uniqueness => {:scope => :user_id}
      def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |account|
          csv << account.attributes.values_at(*column_names)
        end
      end
    end
end


