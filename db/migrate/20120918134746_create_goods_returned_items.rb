class CreateGoodsReturnedItems < ActiveRecord::Migration
  def change
    create_table :goods_returned_items do |t|
      t.integer :goods_returned_id
      t.integer :item_id
      t.decimal :quantity, :precision => 19, :scale => 6
      t.decimal :price, :precision => 19, :scale => 6
      t.string :currency, :limit => 3
      t.decimal :rate, :precision => 19, :scale => 6
      t.decimal :line_total, :precision => 19, :scale => 6
      t.decimal :total_foreign, :precision => 19, :scale => 6
      t.decimal :tax_rate, :precision => 19, :scale => 6
      t.decimal :tax_total, :precision => 19, :scale => 6
      t.decimal :tax_total_foreign, :precision => 19, :scale => 6
      t.decimal :grand_total, :precision => 19, :scale => 6
      t.decimal :grand_total_foreign, :precision => 19, :scale => 6
      t.string :remarks, :limit => 100

      t.timestamps
    end
  end
end
