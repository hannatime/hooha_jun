class AddColumnOmittedToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :omitted, :boolean, :default => false
  end
end
