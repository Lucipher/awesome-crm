class RenameDateColumns < ActiveRecord::Migration
  def up
    [:ar_credit_memos, :ar_dp_invoices, :ar_invoices, :delivery_orders, :sales_orders, :sales_quotations, :sales_returns].each do |t|
      rename_column t, :date, :doc_date
    end
  end

  def down
  end
end
