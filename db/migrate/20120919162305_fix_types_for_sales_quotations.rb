class FixTypesForSalesQuotations < ActiveRecord::Migration
  def up
    change_column :sales_quotations, :rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :disc_rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :disc_total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :tax_rate, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :tax_total, :decimal, :precision => 19, :scale => 6
    change_column :sales_quotations, :grand_total, :decimal, :precision => 19, :scale => 6
  end

  def down
  end
end
