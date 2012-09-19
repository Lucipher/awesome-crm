class FixDataTypesForItems < ActiveRecord::Migration
  def up
    change_column :items, :name, :string, :limit => 100
    change_column :items, :status, :string, :limit => 20
    change_column :items, :type, :string, :limit => 20
    change_column :items, :unit, :string, :limit => 20
    change_column :items, :weight, :decimal, :precision => 19, :scale => 6
    change_column :items, :length, :decimal, :precision => 19, :scale => 6
    change_column :items, :width, :decimal, :precision => 19, :scale => 6
    change_column :items, :height, :decimal, :precision => 19, :scale => 6
    change_column :items, :on_hand, :decimal, :precision => 19, :scale => 6
    change_column :items, :committed, :decimal, :precision => 19, :scale => 6
    change_column :items, :on_order, :decimal, :precision => 19, :scale => 6
    change_column :items, :max_quantity, :decimal, :precision => 19, :scale => 6
    change_column :items, :reorder_quantity, :decimal, :precision => 19, :scale => 6
    change_column :items, :last_purchase_currency, :string, :limit => 3
    change_column :items, :last_purchase_price, :decimal, :precision => 19, :scale => 6
    change_column :items, :last_sales_currency, :string, :limit => 3
    change_column :items, :last_sales_price, :decimal, :precision => 19, :scale => 6
    change_column :items, :average_price, :decimal, :precision => 19, :scale => 6
    change_column :items, :stock_value, :decimal, :precision => 19, :scale => 6
  end

  def down
  end
end
