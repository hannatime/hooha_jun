class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside, :dashboard
  ]

  def home
  end
  
  def inside
  end 

  def dashboard
    @opportunities = Opportunity.accessible_by(current_ability)
    @leads = Lead.accessible_by(current_ability)
    @tasks = Task.accessible_by(current_ability)
    @customers = Customer.accessible_by(current_ability)
    @accounts = Account.accessible_by(current_ability)
    @users = User.accessible_by(current_ability)
  end 

  def about
  end

  def plans
  end

  def feature
  end
    
end
