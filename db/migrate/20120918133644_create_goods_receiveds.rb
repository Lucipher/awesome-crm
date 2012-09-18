class CreateGoodsReceiveds < ActiveRecord::Migration
  def change
    create_table :goods_receiveds do |t|
      t.string :doc_type, :limit => 20
      t.string :doc_status, :limit => 20
      t.date :doc_date
      t.date :doc_due_date
      t.string :doc_currency, :limit => 3
      t.decimal :doc_rate, :precision => 19, :scale => 6
      t.decimal :doc_total, :precision => 19, :scale => 6
      t.decimal :doc_total_fc, :precision => 19, :scale => 6
      t.string :remarks, :limit => 100
      t.integer :employee_id

      t.timestamps
    end
  end
end
