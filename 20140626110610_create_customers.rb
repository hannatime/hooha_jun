class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

      add_column :customers, :customer_first_name, :string
      add_column :customers, :customer_last_name
      add_column :customers, :customer_company
      add_column :customers, :customer_email  
      add_column :customers, :customer_phone 
      add_column :customers, :customer_address
      add_column :customers, :customer_city
      add_column :customers, :customer_state
      add_column :customers, :customer_country
      add_column :customers, :customer_postcode
      
      t.timestamps
    end
  end
end

  


  