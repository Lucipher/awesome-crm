class GoodsReceivedItem < ActiveRecord::Base
  self.table_name = "CRM.GOODS_RECEIVED_ITEMS"
  self.sequence_name = "CRM.GOODS_RECEIVED_ITEMS_SEQ"

  after_save  :update_doc_totals

  attr_accessible :goods_received_id, :grand_total, :item_id, :line_total, :price,
                  :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :goods_received
  belongs_to :item

  validates_presence_of :item, :quantity, :price, :tax_rate

private
  def update_doc_totals
    self.goods_received.doc_total = self.goods_received.goods_received_items.map(&:grand_total).reduce(:+)
    self.goods_received.save
  end
end
