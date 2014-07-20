class OpportunitiesController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @q = Opportunity.accessible_by(current_ability).search(params[:q])
    @opportunities = @q.result(distinct: true).page params[:page] 
    respond_to do |format|
    format.html
    format.csv { send_data @opportunities.to_csv }
    format.xls { send_data @opportunities.to_csv(col_sep: "\t") }
  end 
        end

  def show
     @opportunities = Opportunity.accessible_by(current_ability)

    authorize! :show, @opportunity
  end

  def new
    @opportunity = Opportunity.new
    @opportunities = Opportunity.accessible_by(current_ability)
  end

  def edit
    @opportunity = Opportunity.accessible_by(current_ability).find(params[:id])
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
        :opportunity_name,  
        :opportunity_amount, 
        :opportunity_stage, 
        :opportunity_probability, 
        :opportunity_contact_name, 
        :opportunity_comments, 
        :opportunity_closing_date,
        {:customer_ids => []}
        )
    end
end