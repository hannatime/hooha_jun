class AddAttributesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_name, :string
    add_column :accounts, :account_assigned_to, :string
    add_column :accounts, :account_website, :string
    add_column :accounts, :account_phone, :string
    add_column :accounts, :account_address, :string
    add_column :accounts, :account_postcode, :string
    add_column :accounts, :account_city, :string
    add_column :accounts, :account_state, :string
    add_column :accounts, :account_country, :string
  end
end
