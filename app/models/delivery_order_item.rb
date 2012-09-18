class DeliveryOrderItem < ActiveRecord::Base
  set_table_name "CRM.DELIVERY_ORDER_ITEMS"
  self.sequence_name = "CRM.DELIVERY_ORDER_ITEMS_SEQ"

  attr_accessible :currency, :delivery_order_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :rate, :remarks, :tax_rate, :tax_total

  belongs_to :delivery_order
  belongs_to :item
end
