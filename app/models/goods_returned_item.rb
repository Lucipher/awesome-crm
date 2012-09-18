class GoodsReturnedItem < ActiveRecord::Base
  set_table_name "CRM.GOODS_RETURNED_ITEMS"
  self.sequence_name = "CRM.GOOD_RETURNED_ITEMS_SEQ"

  attr_accessible :currency, :goods_returned_id, :grand_total, :grand_total_foreign, :item_id, :line_total, :price,
                  :quantity, :rate, :remarks, :tax_rate, :tax_total, :tax_total_forign, :total_foreign

  belongs_to :goods_returned
  belongs_to :item
end
