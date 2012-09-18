class SalesOrderItem < ActiveRecord::Base
  set_table_name "CRM.SALES_ORDER_ITEMS"
  self.sequence_name = "CRM.SALES_ORDER_ITEMS_SEQ"

  attr_accessible :currency, :disc_rate, :disc_total, :grand_total, :item_id, :line_num, :line_status, :line_total,
                  :price, :quantity, :rate, :remarks, :tax_rate, :tax_total

  belongs_to :item
  belongs_to :sales_order
end
