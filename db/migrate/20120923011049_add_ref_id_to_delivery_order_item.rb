class AddRefIdToDeliveryOrderItem < ActiveRecord::Migration
  def change
    add_column :delivery_order_items, :ref_id, :integer
  end
end
