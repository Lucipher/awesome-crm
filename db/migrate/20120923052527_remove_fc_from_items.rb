class RemoveFcFromItems < ActiveRecord::Migration
  def up
    [:ar_credit_memo_items, :ar_dp_invoice_items, :ar_invoice_items, :delivery_order_items, :sales_order_items,
     :sales_quotation_items, :sales_return_items].each do |t|
      remove_column t, :currency
      remove_column t, :rate
    end
  end

  def down
  end
end
