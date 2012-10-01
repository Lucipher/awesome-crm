class SalesQuotationItem < ActiveRecord::Base
  self.table_name = "CRM.SALES_QUOTATION_ITEMS"
  self.sequence_name = "CRM.SALES_QUOTATION_ITEMS_SEQ"

  after_save  :update_doc_totals

  attr_accessible :disc_rate, :disc_total, :grand_total, :item_id, :line_num, :line_status, :line_total,
                  :price, :quantity, :remarks, :sales_quotation_id, :tax_rate, :tax_total

  belongs_to :sales_quotation
  belongs_to :item

  validates_presence_of :item, :quantity, :price, :disc_rate, :tax_rate

private
  def update_doc_totals
    self.sales_quotation.total = self.sales_quotation.sales_quotation_items.map(&:line_total).reduce(:+)
    self.sales_quotation.disc_total = self.sales_quotation.sales_quotation_items.map(&:disc_total).reduce(:+)
    self.sales_quotation.tax_total = self.sales_quotation.sales_quotation_items.map(&:tax_total).reduce(:+)
    self.sales_quotation.grand_total = self.sales_quotation.sales_quotation_items.map(&:grand_total).reduce(:+)
    self.sales_quotation.save
  end

end
