class AddSalesOpportunityIdToSalesOpportunityItems < ActiveRecord::Migration
  def change
    add_column :sales_opportunity_items, :sales_opportunity_id, :integer
  end
end
