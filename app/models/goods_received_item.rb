class GoodsReceivedItem < ActiveRecord::Base
  self.table_name = "CRM.GOODS_RECEIVED_ITEMS"
  self.sequence_name = "CRM.GOODS_RECEIVED_ITEMS_SEQ"

  attr_accessible :currency, :goods_received_id, :grand_total, :item_id, :line_total, :price,
                  :quantity, :rate, :remarks, :tax_rate, :tax_total

  belongs_to :goods_received
  belongs_to :item

  validates_presence_of :item
end
