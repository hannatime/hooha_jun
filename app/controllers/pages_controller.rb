class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside, :dashboard
  ]

  def home
  end
  
  def inside
  end 
    

  def dashboard

      @q = Task.accessible_by(current_ability).search(params[:q])
      @tasks1 = @q.result(distinct: true).page params[:page]

      @q = Opportunity.accessible_by(current_ability).search(params[:q])
      @opportunities1 = @q.result(distinct: true).page params[:page]
    # @tasks1 = Task.accessible_by(current_ability).order(:task_due_date).page params[:page]
    @tasks = Task.accessible_by(current_ability)
    #@opportunities1 = Opportunity.accessible_by(current_ability).order(:opportunity_closing_date).page params[:page]
    @opportunities = Opportunity.accessible_by(current_ability)
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
