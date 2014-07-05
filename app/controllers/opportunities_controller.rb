class OpportunitiesController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  # GET /opportunities
  # GET /opportunities.json
  def index
    @opportunities = Opportunity.accessible_by(current_ability)
  end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show
    authorize! :show, @opportunity
  end

  # GET /opportunities/new
  def new
    @opportunity = Opportunity.new
    @opportunity_owner = User.all.map(&:email)
    @accounts = Account.accessible_by(current_ability).all.map { |account| [account.account_name, account.id]}

  end

  # GET /opportunities/1/edit
  def edit
    @opportunity = Opportunity.find(params[:id])
    authorize! :edit, @opportunity
  end

  # POST /opportunities
  # POST /opportunities.json
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

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
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

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params[:opportunity]
    end

    def opportunity_params
      params.require(:opportunity).permit(:account_id, :opportunity_name, :opportunity_account_name, :opportunity_amount, :opportunity_stage, :opportunity_owner, :opportunity_probability, :opportunity_contact_name, :opportunity_comments, :opportunity_closing_date)
    end
end