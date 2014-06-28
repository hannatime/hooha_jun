class AddAttributesToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :lead_interested_in, :string
    add_column :leads, :lead_comments, :string
    add_column :leads, :lead_status, :string
    add_column :leads, :lead_source, :string
    add_column :leads, :lead_owner, :string
    add_column :leads, :lead_account_name, :string
    add_column :leads, :lead_opportunity_name, :string
    add_column :leads, :lead_opportunity_owner, :string
  end
end