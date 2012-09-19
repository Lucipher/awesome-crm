class FixTypesForSalesQuotationItems < ActiveRecord::Migration
  def up
    change_column :sales_quotation_items, :quantity, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :price, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :line_total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :disc_rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :disc_total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :tax_rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :tax_total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotation_items, :grand_total, :decimal, :precision => 19, :scale => 6
  end

  def down
  end
end
