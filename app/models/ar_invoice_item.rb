class ArInvoiceItem < ActiveRecord::Base
  self.table_name = "CRM.AR_INVOICE_ITEMS"
  self.sequence_name = "CRM.AR_INVOICE_ITEMS_SEQ"

  attr_accessible :currency, :ar_invoice_id, :disc_rate, :disc_total, :grand_total, :item_id, :line_num,
                  :line_status, :line_total, :price, :quantity, :rate, :remarks, :tax_rate, :tax_total

  belongs_to :ar_invoice
  belongs_to :item

  validates_presence_of :item
end
