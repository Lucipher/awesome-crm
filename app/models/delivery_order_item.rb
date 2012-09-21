class DeliveryOrderItem < ActiveRecord::Base
  self.table_name = "CRM.DELIVERY_ORDER_ITEMS"
  self.sequence_name = "CRM.DELIVERY_ORDER_ITEMS_SEQ"

  attr_accessible :currency, :delivery_order_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :rate, :remarks, :tax_rate, :tax_total

  belongs_to :delivery_order
  belongs_to :item

  validates_presence_of :item

  def self.copy_from(sales_order_item)
    delivery_order_item = DeliveryOrderItem.new

    delivery_order_item.currency      = sales_order_item.currency
    delivery_order_item.disc_rate     = sales_order_item.disc_rate
    delivery_order_item.disc_total    = sales_order_item.disc_total
    delivery_order_item.grand_total   = sales_order_item.grand_total
    delivery_order_item.item          = sales_order_item.item
    delivery_order_item.line_num      = sales_order_item.line_num
    delivery_order_item.line_status   = sales_order_item.line_status
    delivery_order_item.line_total    = sales_order_item.line_total
    delivery_order_item.price         = sales_order_item.price
    delivery_order_item.quantity      = sales_order_item.quantity
    delivery_order_item.rate          = sales_order_item.rate
    delivery_order_item.remarks       = sales_order_item.remarks
    delivery_order_item.tax_rate      = sales_order_item.tax_rate
    delivery_order_item.tax_total     = sales_order_item.tax_total

    delivery_order_item
  end
end
