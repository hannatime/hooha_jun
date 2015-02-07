class Admin::BaseController < ApplicationController
  before_filter :require_admin!
  
  def index
    @last_signups = User.last_signups(10)
    @last_signins = User.last_signins(10)
    @count = User.users_count 
        @accounts = Account.accessible_by(current_ability)
    @opportunities = Opportunity.accessible_by(current_ability)
  end
end
