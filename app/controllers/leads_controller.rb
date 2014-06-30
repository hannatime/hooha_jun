class LeadsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.accessible_by(current_ability)
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    authorize! :show, @lead
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find(params[:id])
    authorize! :edit, @lead
  
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    authorize! :create, @lead

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lead }
      else
        format.html { render action: 'new' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = Lead.find(params[:id])
    authorize! :destroy, @lead
    @lead.destroy
    @lead = Lead.accessible_by(current_ability)
    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:lead_interested_in,:lead_comments,:lead_status,:lead_source,:lead_owner,:lead_account_name,:lead_opportunity_name,:lead_opportunity_owner)
    end
end