class SalesReturn < ActiveRecord::Base
  set_table_name "CRM.SALES_RETURNS"
  self.sequence_name = "CRM.SALES_RETURNS_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :sales_return_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :sales_return_items

  accepts_nested_attributes_for :sales_return_items
end
