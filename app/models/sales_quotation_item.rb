class SalesQuotationItem < ActiveRecord::Base
  self.table_name = "CRM.SALES_QUOTATION_ITEMS"
  self.sequence_name = "CRM.SALES_QUOTATION_ITEMS_SEQ"

  attr_accessible :disc_rate, :disc_total, :grand_total, :item_id, :line_num, :line_status, :line_total,
                  :price, :quantity, :remarks, :sales_quotation_id, :tax_rate, :tax_total

  belongs_to :sales_quotation
  belongs_to :item

  validates_presence_of :item, :quantity, :price, :disc_rate, :tax_rate

end
