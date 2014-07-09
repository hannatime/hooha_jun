class CustomersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.accessible_by(current_ability)
  end

  def show
    authorize! :show, @customer
  end

  def new
    @customer = Customer.new
    @accounts = Account.accessible_by(current_ability).all.map { |account| [account.account_name, account.id]}

  end

  def edit
    @customer = Customer.find(params[:id])
    authorize! :edit, @customer
    @accounts = Account.accessible_by(current_ability).all.map { |account| [account.account_name, account.id]}
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    authorize! :create, @customer
    @accounts = Account.accessible_by(current_ability).all.map { |account| [account.account_name, account.id]}
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @accounts = Account.accessible_by(current_ability).all.map { |account| [account.account_name, account.id]}

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    authorize! :destroy, @customer
    @customer.destroy
    @customers = Customer.accessible_by(current_ability)    
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:account_id, :customer_first_name,:customer_last_name,:customer_email,:customer_phone,:customer_address,:customer_city,:customer_state,:customer_country,:customer_postcode)
    end
end
