class AddAttributesToOpportunities < ActiveRecord::Migration
  def change
    
    add_column :opportunities, :opportunity_name, :string
    add_column :opportunities, :opportunity_amount, :decimal
    add_column :opportunities, :opportunity_stage, :string
    add_column :opportunities, :opportunity_probability, :string
    add_column :opportunities, :opportunity_contact_name, :string
    add_column :opportunities, :opportunity_comments, :string
    add_column :opportunities, :opportunity_closing_date, :date

  end
end
