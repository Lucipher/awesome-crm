class GoodsReturnedItem < ActiveRecord::Base
  self.table_name = "CRM.GOODS_RETURNED_ITEMS"
  self.sequence_name = "CRM.GOODS_RETURNED_ITEMS_SEQ"

  after_save  :update_doc_totals

  attr_accessible :goods_returned_id, :grand_total, :item_id, :line_total, :price,
                  :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :goods_returned
  belongs_to :item

  validates_presence_of :item, :quantity, :price, :tax_rate

private
  def update_doc_totals
    self.goods_returned.doc_total = self.goods_returned.goods_returned_items.map(&:grand_total).reduce(:+)
    self.goods_returned.save
  end

end
