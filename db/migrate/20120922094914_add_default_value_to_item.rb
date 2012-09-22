class AddDefaultValueToItem < ActiveRecord::Migration
  def change
    change_column :items, :on_hand,       :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :items, :committed,     :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :items, :on_order,      :decimal, :precision => 19, :scale => 6, :default => 0
    change_column :items, :stock_value,   :decimal, :precision => 19, :scale => 6, :default => 0
  end
end
