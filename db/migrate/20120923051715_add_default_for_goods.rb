class AddDefaultForGoods < ActiveRecord::Migration
  def up
    [:goods_receiveds, :goods_returneds].each do |t|
      change_column t, :doc_total,       :decimal, :precision => 19, :scale => 6, :default => 0
    end
  end

  def down
    [:goods_receiveds, :goods_returneds].each do |t|
      change_column t, :doc_total,       :decimal, :precision => 19, :scale => 6
    end
  end
end
