class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside, :dashboard
  ]

  def home
  end
  
  def inside
  end 

  def dashboard
    @opportunities = Opportunity.all
    @leads = Lead.all
    @tasks = Task.all
    @customers = Customer.all
    @accounts = Account.all
    @users = User.all
  end 

  def about
  end

  def plans
  end

  def feature
  end
    
end
