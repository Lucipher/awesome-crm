class ArDpInvoiceItem < ActiveRecord::Base
  self.table_name = "CRM.AR_DP_INVOICE_ITEMS"
  self.sequence_name = "CRM.AR_DP_INVOICE_ITEMS_SEQ"

  after_save  :update_doc_totals

  attr_accessible :ar_dp_invoice_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :ar_dp_invoice
  belongs_to :item
  belongs_to :ref, :foreign_key => 'ref_id', :class_name => 'SalesOrderItem'

  validates_presence_of :item, :quantity, :price, :disc_rate, :tax_rate

  def self.copy_from(src)
    item = ArDpInvoiceItem.new

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
    self.ar_dp_invoice.total = self.ar_dp_invoice.ar_dp_invoice_items.map(&:line_total).reduce(:+)
    self.ar_dp_invoice.disc_total = self.ar_dp_invoice.ar_dp_invoice_items.map(&:disc_total).reduce(:+)
    self.ar_dp_invoice.tax_total = self.ar_dp_invoice.ar_dp_invoice_items.map(&:tax_total).reduce(:+)
    self.ar_dp_invoice.grand_total = self.ar_dp_invoice.ar_dp_invoice_items.map(&:grand_total).reduce(:+)
    self.ar_dp_invoice.save
  end
  
end
