class CreateCustomersOpportunitiesJoinTable < ActiveRecord::Migration
  def change
    create_table :customers_opportunities, id: false do |t|
      t.integer :customer_id
      t.integer :opportunity_id
    end
  end
end
