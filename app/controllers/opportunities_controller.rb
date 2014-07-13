class OpportunitiesController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = Opportunity.accessible_by(current_ability)
    @opportunities = Opportunity.order(:opportunity_closing_date).page params[:page]
  end

  def show
    authorize! :show, @opportunity
  end

  def new
    @opportunity = Opportunity.new
    @opportunities = Opportunity.accessible_by(current_ability)
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
    authorize! :edit, @opportunity

  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.user = current_user
    authorize! :create, @opportunity

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @opportunity }
      else
        format.html { render action: 'new' }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    authorize! :destroy, @opportunity
    @opportunity.destroy
    @opportunity = Opportunity.accessible_by(current_ability)
    respond_to do |format|
      format.html { redirect_to opportunities_url }
      format.json { head :no_content }
    end
  end

  private
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    def opportunity_params
      params[:opportunity]
    end

    def opportunity_params
      params.require(:opportunity).permit(
        :account_id, 
        :customer_id, 
        :opportunity_name,  
        :opportunity_amount, 
        :opportunity_stage, 
        :opportunity_probability, 
        :opportunity_contact_name, 
        :opportunity_comments, 
        :opportunity_closing_date
        )
    end
end