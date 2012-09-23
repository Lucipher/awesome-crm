class AddDefaultValueToDeliveryOrder < ActiveRecord::Migration
  def up
    change_column :delivery_orders, :total,  :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :delivery_orders, :disc_total,  :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :delivery_orders, :tax_total,   :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :delivery_orders, :grand_total, :decimal, :precision => 19, :scale => 6, :default => 0
  end

  def down
    change_column :delivery_orders, :total,  :decimal, :precision => 19, :scale => 6
    change_column :delivery_orders, :disc_total,  :decimal, :precision => 19, :scale => 6
    change_column :delivery_orders, :tax_total,   :decimal, :precision => 19, :scale => 6
    change_column :delivery_orders, :grand_total, :decimal, :precision => 19, :scale => 6
  end
end
