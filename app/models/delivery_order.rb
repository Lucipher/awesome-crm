class DeliveryOrder < ActiveRecord::Base
  set_table_name "CRM.DELIVERY_ORDERS"
  self.sequence_name = "CRM.DELIVERY_ORDERS_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :delivery_order_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :delivery_order_items

  accepts_nested_attributes_for :delivery_order_items
end
