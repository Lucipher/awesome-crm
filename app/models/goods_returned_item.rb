class GoodsReturnedItem < ActiveRecord::Base
  self.table_name = "CRM.GOODS_RETURNED_ITEMS"
  self.sequence_name = "CRM.GOODS_RETURNED_ITEMS_SEQ"

  attr_accessible :goods_returned_id, :grand_total, :item_id, :line_total, :price,
                  :quantity, :remarks, :tax_rate, :tax_total

  belongs_to :goods_returned
  belongs_to :item

  validates_presence_of :item, :quantity, :price, :tax_rate
end
