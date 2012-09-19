class AddSalesOrderIdToSalesOrderItems < ActiveRecord::Migration
  def change
    add_column :sales_order_items, :sales_order_id, :integer
  end
end
