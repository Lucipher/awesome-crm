class RemoveForeignFromGoodsReturnedItems < ActiveRecord::Migration
  def up
    remove_column :goods_returned_items, :total_foreign
    remove_column :goods_returned_items, :tax_total_foreign
    remove_column :goods_returned_items, :grand_total_foreign
  end

  def down
    add_column :goods_returned_items, :grand_total_foreign, :decimal, :precision => 19, :scale => 6
    add_column :goods_returned_items, :tax_total_foreign, :decimal, :precision => 19, :scale => 6
    add_column :goods_returned_items, :total_foreign, :decimal, :precision => 19, :scale => 6
  end
end
