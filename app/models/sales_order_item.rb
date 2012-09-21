class SalesOrderItem < ActiveRecord::Base
  self.table_name = "CRM.SALES_ORDER_ITEMS"
  self.sequence_name = "CRM.SALES_ORDER_ITEMS_SEQ"

  attr_accessible :currency, :disc_rate, :disc_total, :grand_total, :item_id, :line_num, :line_status, :line_total,
                  :price, :quantity, :rate, :remarks, :tax_rate, :tax_total, :sales_order_id

  belongs_to :item
  belongs_to :sales_order

  validates_presence_of :item

  def self.copy_from(sales_quotation_item)
    sales_order_item = SalesOrderItem.new

    sales_order_item.currency      = sales_quotation_item.currency
    sales_order_item.disc_rate     = sales_quotation_item.disc_rate
    sales_order_item.disc_total    = sales_quotation_item.disc_total
    sales_order_item.grand_total   = sales_quotation_item.grand_total
    sales_order_item.item          = sales_quotation_item.item
    sales_order_item.line_num      = sales_quotation_item.line_num
    sales_order_item.line_status   = sales_quotation_item.line_status
    sales_order_item.line_total    = sales_quotation_item.line_total
    sales_order_item.price         = sales_quotation_item.price
    sales_order_item.quantity      = sales_quotation_item.quantity
    sales_order_item.rate          = sales_quotation_item.rate
    sales_order_item.remarks       = sales_quotation_item.remarks
    sales_order_item.tax_rate      = sales_quotation_item.tax_rate
    sales_order_item.tax_total     = sales_quotation_item.tax_total

    sales_order_item
  end

end
