class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :status
      t.string :type
      t.string :unit
      t.decimal :weight
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.integer :group_id
      t.decimal :on_hand
      t.decimal :committed
      t.decimal :on_order
      t.decimal :max_quantity
      t.decimal :reorder_quantity
      t.decimal :last_purchase_price
      t.string :last_purchase_currency
      t.date :last_purchase_date
      t.decimal :last_sales_price
      t.string :last_sales_currency
      t.date :last_sales_date
      t.decimal :average_price
      t.decimal :stock_value

      t.timestamps
    end
  end
end
