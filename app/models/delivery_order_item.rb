class DeliveryOrderItem < ActiveRecord::Base
  self.table_name = "CRM.DELIVERY_ORDER_ITEMS"
  self.sequence_name = "CRM.DELIVERY_ORDER_ITEMS_SEQ"

  attr_accessible :delivery_order_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :delivery_order
  belongs_to :item
  belongs_to :ref, :foreign_key => 'ref_id', :class_name => 'SalesOrderItem'

  validates_presence_of :item, :quantity, :price, :disc_rate, :tax_rate

  def self.copy_from(src)
    item = DeliveryOrderItem.new

    item.ref           = src
    item.disc_rate     = src.disc_rate
    item.disc_total    = src.disc_total
    item.grand_total   = src.grand_total
    item.item          = src.item
    item.line_num      = src.line_num
    item.line_status   = src.line_status
    item.line_total    = src.line_total
    item.price         = src.price
    item.quantity      = src.quantity
    item.remarks       = src.remarks
    item.tax_rate      = src.tax_rate
    item.tax_total     = src.tax_total

    item
  end
end
