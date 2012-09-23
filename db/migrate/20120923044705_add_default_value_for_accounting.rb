class AddDefaultValueForAccounting < ActiveRecord::Migration
  def up
    [:ar_credit_memos, :ar_dp_invoices, :ar_invoices, :delivery_orders, :sales_orders, :sales_quotations, :sales_returns].each do |t|
      change_column t, :total,       :decimal, :precision => 19, :scale => 6, :default => 0
      change_column t, :disc_total,  :decimal, :precision => 19, :scale => 6, :default => 0
      change_column t, :tax_total,   :decimal, :precision => 19, :scale => 6, :default => 0
      change_column t, :grand_total, :decimal, :precision => 19, :scale => 6, :default => 0
    end
  end

  def down
    [:ar_credit_memos, :ar_dp_invoices, :ar_invoices, :delivery_orders, :sales_orders, :sales_quotations, :sales_returns].each do |t|
      change_column t, :total,       :decimal, :precision => 19, :scale => 6
      change_column t, :disc_total,  :decimal, :precision => 19, :scale => 6
      change_column t, :tax_total,   :decimal, :precision => 19, :scale => 6
      change_column t, :grand_total, :decimal, :precision => 19, :scale => 6
    end
  end
end
