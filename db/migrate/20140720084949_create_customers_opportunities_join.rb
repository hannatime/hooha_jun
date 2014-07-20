class CreateCustomersOpportunitiesJoin < ActiveRecord::Migration
  def change
    create_table :customers_opportunities, :id => false do |t|
    t.column :customer_id, :integer
    t.column :opportunity_id, :integer
    end
  end
end