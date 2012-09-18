class CreateDeliveryOrderItems < ActiveRecord::Migration
  def change
    create_table :delivery_order_items do |t|
      t.integer :delivery_order_id
      t.integer :line_num
      t.string :line_status, :limit => 20
      t.integer :item_id
      t.decimal :quantity, :precision => 19, :scale => 6
      t.decimal :price, :precision => 19, :scale => 6
      t.string :currency, :limit => 3
      t.decimal :rate, :precision => 19, :scale => 6
      t.decimal :line_total, :precision => 19, :scale => 6
      t.decimal :disc_rate, :precision => 19, :scale => 6
      t.decimal :disc_total, :precision => 19, :scale => 6
      t.decimal :tax_rate, :precision => 19, :scale => 6
      t.decimal :tax_total, :precision => 19, :scale => 6
      t.decimal :grand_total, :precision => 19, :scale => 6
      t.string :remarks, :limit => 100

      t.timestamps
    end
  end
end
