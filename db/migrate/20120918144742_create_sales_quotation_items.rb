class CreateSalesQuotationItems < ActiveRecord::Migration
  def change
    create_table :sales_quotation_items do |t|
      t.integer :sales_quotation_id
      t.integer :line_num
      t.string :line_status, :limit => 20
      t.integer :item_id
      t.decimal :quantity
      t.decimal :price
      t.string :currency, :limit => 3
      t.decimal :rate
      t.decimal :line_total
      t.decimal :disc_rate
      t.decimal :disc_total
      t.decimal :tax_rate
      t.decimal :tax_total
      t.decimal :grand_total
      t.string :remarks, :limit => 100

      t.timestamps
    end
  end
end
