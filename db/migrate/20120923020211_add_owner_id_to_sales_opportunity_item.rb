class AddOwnerIdToSalesOpportunityItem < ActiveRecord::Migration
  def change
    add_column :sales_opportunity_items, :owner_id, :integer
  end
end
