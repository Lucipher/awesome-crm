class AddRefIdToSalesOrderItem < ActiveRecord::Migration
  def up
    add_column :sales_order_items, :ref_id, :integer
  end

  def down
    remove_column :sales_order_items, :ref_id
  end
end
