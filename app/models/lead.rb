class Lead < ActiveRecord::Base

  validates_presence_of :lead_owner, :lead_comments

end
