class Item < ActiveRecord::Base
  set_table_name "CRM.ITEMS"
  self.sequence_name = "CRM.ITEMS_SEQ"

  attr_accessible :average_price, :committed, :group_id, :height, :last_purchase_currency, :last_purchase_date,
                  :last_purchase_price, :last_sales_currency, :last_sales_date, :last_sales_price, :length,
                  :max_quantity, :name, :on_hand, :on_order, :reorder_quantity, :status, :stock_value, :type,
                  :unit, :weight, :width

  has_many :goods_received_items
  has_many :goods_returned_items
  has_many :sales_orders
  has_many :sales_quotations
  has_many :sales_opportunities
  has_many :sales_quotations
  has_many :sales_orders
  has_many :delivery_orders
  has_many :sales_returns
  has_many :ar_invoices
  has_many :ar_credit_memos
  has_many :ar_down_payment_invoices

  belongs_to :group

end
