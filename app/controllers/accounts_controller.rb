class AccountsController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.accessible_by(current_ability)
    @accounts = Account.order(:account_name).page params[:page]
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @accounts = Account.accessible_by(current_ability)
    authorize! :show, @account
  end

  # GET /accounts/new
  def new
    @account = Account.new 
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    authorize! :edit, @account
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user = current_user
    authorize! :create, @account
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    authorize! :destroy, @account
    @account.destroy
    @accounts = Account.accessible_by(current_ability)
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit( 
        :account_name, 
        :account_website, 
        :account_phone, 
        :account_address, 
        :account_postcode, 
        :account_city, 
        :account_state, 
        :account_country
        )
    end
end
