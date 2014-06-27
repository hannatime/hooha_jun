class AddAttributesToOpportunities < ActiveRecord::Migration
  def change
    
    add_column :opportunities, :opportunity_name, :string
    add_column :opportunities, :account_name, :string
    add_column :opportunities, :type, :string
    add_column :opportunities, :amount, :string
    add_column :opportunities, :stage, :string
    add_column :opportunities, :owner, :string
    add_column :opportunities, :probability, :string
    add_column :opportunities, :contact_name, :string
    add_column :opportunities, :comments, :string
    add_column :opportunities, :closing_date, :string

  end
end
