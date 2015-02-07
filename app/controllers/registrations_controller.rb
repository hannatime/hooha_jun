class RegistrationsController < Devise::RegistrationsController

  def edit
  
    @accounts = Account.accessible_by(current_ability)
    @opportunities = Opportunity.accessible_by(current_ability)

  end

  def index
  
    @accounts = Account.accessible_by(current_ability)
    @opportunities = Opportunity.accessible_by(current_ability)

  end

    def show
  
    @accounts = Account.accessible_by(current_ability)
    @opportunities = Opportunity.accessible_by(current_ability)

  end

  def new
    @plan = params[:plan]
    if @plan && ENV["ROLES"].include?(@plan) && @plan != "admin"
      super
    else
      redirect_to root_path, :notice => 'Please select a subscription plan below.'
    end
  end

  private
  def build_resource(*args)
    super
    if params[:plan]
      resource.add_role(params[:plan])
    end
  end
end