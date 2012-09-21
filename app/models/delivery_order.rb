class DeliveryOrder < ActiveRecord::Base
  self.table_name = "CRM.DELIVERY_ORDERS"
  self.sequence_name = "CRM.DELIVERY_ORDERS_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :delivery_order_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :delivery_order_items

  accepts_nested_attributes_for :delivery_order_items

  validates_presence_of :business_partner, :sales_person

  def self.copy_from(sales_order)
    delivery_order = DeliveryOrder.new

    delivery_order.business_partner   = sales_order.business_partner
    delivery_order.currency           = sales_order.currency
    delivery_order.date               = sales_order.date
    delivery_order.disc_rate          = sales_order.disc_rate
    delivery_order.disc_total         = sales_order.disc_total
    delivery_order.due_date           = sales_order.due_date
    delivery_order.grand_total        = sales_order.grand_total
    delivery_order.rate               = sales_order.rate
    delivery_order.remarks            = sales_order.remarks
    delivery_order.sales_person       = sales_order.sales_person
    delivery_order.shipping_date      = sales_order.shipping_date
    delivery_order.status             = sales_order.status
    delivery_order.tax_rate           = sales_order.tax_rate
    delivery_order.tax_total          = sales_order.tax_total
    delivery_order.total              = sales_order.total
    delivery_order.type               = sales_order.type

    sales_order.sales_order_items.each do |sales_order_item|
      delivery_order_item = DeliveryOrderItem.copy_from(sales_order_item)
      delivery_order_item.delivery_order = delivery_order
      delivery_order.delivery_order_items << delivery_order_item
    end

    delivery_order
  end
end
