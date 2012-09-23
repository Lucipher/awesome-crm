class RemoveFcFromGoods < ActiveRecord::Migration
  def up
    [:goods_received_items, :goods_returned_items].each do |t|
      remove_column t, :currency
      remove_column t, :rate
    end

    [:goods_receiveds, :goods_returneds].each do |t|
      remove_column t, :doc_currency
      remove_column t, :doc_rate
      remove_column t, :doc_total_fc
    end
  end

  def down
  end
end
