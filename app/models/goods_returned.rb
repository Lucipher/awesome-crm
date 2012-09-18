class GoodsReturned < ActiveRecord::Base
  set_table_name "CRM.GOODS_RETURNEDS"
  self.sequence_name = "CRM.GOOD_RETURNEDS_SEQ"

  attr_accessible :doc_currency, :doc_date, :doc_due_date, :doc_rate, :doc_status, :doc_total, :doc_total_fc,
                  :doc_type, :employee_id, :remarks

  belongs_to :employee
  has_many :goods_returned_items

  accepts_nested_attributes_for :goods_returned_items
end
