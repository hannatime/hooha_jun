class Lead < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :user, :lead_comments, :lead_interested_in

end
