class RemoveFcFromForms < ActiveRecord::Migration
  def up
    [:ar_credit_memos, :ar_dp_invoices, :ar_invoices, :delivery_orders, :sales_orders, :sales_quotations, :sales_returns].each do |t|
      remove_column t, :currency
      remove_column t, :rate
    end
  end

  def down
  end
end
