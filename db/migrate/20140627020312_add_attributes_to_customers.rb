class AddAttributesToCustomers < ActiveRecord::Migration
  def change

    add_column :customers, :customer_first_name, :string
    add_column :customers, :customer_last_name, :string
    add_column :customers, :customer_email, :string
    add_column :customers, :customer_phone, :string
    add_column :customers, :customer_address, :string
    add_column :customers, :customer_city, :string
    add_column :customers, :customer_state, :string
    add_column :customers, :customer_country, :string
    add_column :customers, :customer_postcode, :string

  end
end
