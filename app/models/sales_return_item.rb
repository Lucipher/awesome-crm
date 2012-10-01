class SalesReturnItem < ActiveRecord::Base
  self.table_name = "CRM.SALES_RETURN_ITEMS"
  self.sequence_name = "CRM.SALES_RETURN_ITEMS_SEQ"

  after_save  :update_doc_totals

  attr_accessible :sales_return_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :sales_return
  belongs_to :item
  belongs_to :ref, :foreign_key => 'ref_id', :class_name => 'DeliveryOrderItem'

  validates_presence_of :item, :quantity, :price, :disc_rate, :tax_rate

  def self.copy_from(src)
    item = SalesReturnItem.new

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

private
  def update_doc_totals
    self.sales_return.total = self.sales_return.sales_return_items.map(&:line_total).reduce(:+)
    self.sales_return.disc_total = self.sales_return.sales_return_items.map(&:disc_total).reduce(:+)
    self.sales_return.tax_total = self.sales_return.sales_return_items.map(&:tax_total).reduce(:+)
    self.sales_return.grand_total = self.sales_return.sales_return_items.map(&:grand_total).reduce(:+)
    self.sales_return.save
  end
end
