class User < ActiveRecord::Base
  rolify
  # Use friendly_id on Users
  extend FriendlyId
  friendly_id :friendify, use: :slugged
  
  has_many :tasks
  has_many :leads
  has_many :opportunities
  has_many :customers
  has_many :accounts

  def index
  @accounts = @current_user.accounts
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :stripe_token, :coupon

  # Pagination
  paginates_per 100
  
  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  def self.paged(page_number)
    order(admin: :desc, email: :asc).page page_number
  end
  
  def friendify
    if email.downcase == "admin@example.com"
      "user-#{email}"
    else
      "#{email}"
    end
  end

  def self.search_and_order(search, page_number)
    if search
      where("email LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, email: :asc
      ).page page_number
    else
      order(admin: :desc, email: :asc).page page_number
    end
  end
  
  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","email","slug","created_at")
  end
  
  def self.last_signins(count)
    order(last_sign_in_at: 
    :desc).limit(count).select("id","email","slug","last_sign_in_at")
  end
  
  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end
end
