class Item < ActiveRecord::Base
  self.table_name = "CRM.ITEMS"
  self.sequence_name = "CRM.ITEMS_SEQ"

  attr_accessible :average_price, :committed, :group_id, :height, :last_purchase_currency, :last_purchase_date,
                  :last_purchase_price, :last_sales_currency, :last_sales_date, :last_sales_price, :length,
                  :max_quantity, :name, :on_hand, :on_order, :reorder_quantity, :status, :stock_value, :type,
                  :unit, :weight, :width

  has_many :goods_received_items
  has_many :goods_returned_items
  has_many :sales_order_items
  has_many :sales_quotation_items
  has_many :sales_opportunity_items
  has_many :sales_quotation_items
  has_many :sales_order_items
  has_many :delivery_order_items
  has_many :sales_return_items
  has_many :ar_invoice_items
  has_many :ar_credit_memo_items
  has_many :ar_down_payment_invoice_items

  belongs_to :group

end
