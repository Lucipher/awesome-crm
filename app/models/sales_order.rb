class SalesOrder < ActiveRecord::Base
  self.table_name = "CRM.SALES_ORDERS"
  self.sequence_name = "CRM.SALES_ORDERS_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :sales_order_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person
  has_many :sales_order_items

  accepts_nested_attributes_for :sales_order_items

  validates_presence_of :business_partner, :sales_person

  def self.copy_from(sales_quotation)
    sales_order = SalesOrder.new

    sales_order.business_partner   = sales_quotation.business_partner
    sales_order.currency           = sales_quotation.currency
    sales_order.date               = sales_quotation.date
    sales_order.disc_rate          = sales_quotation.disc_rate
    sales_order.disc_total         = sales_quotation.disc_total
    sales_order.due_date           = sales_quotation.due_date
    sales_order.grand_total        = sales_quotation.grand_total
    sales_order.rate               = sales_quotation.rate
    sales_order.remarks            = sales_quotation.remarks
    sales_order.sales_person       = sales_quotation.sales_person
    sales_order.shipping_date      = sales_quotation.shipping_date
    sales_order.status             = sales_quotation.status
    sales_order.tax_rate           = sales_quotation.tax_rate
    sales_order.tax_total          = sales_quotation.tax_total
    sales_order.total              = sales_quotation.total
    sales_order.type               = sales_quotation.type

    sales_quotation.sales_quotation_items.each do |sales_quotation_item|
      sales_order_item = SalesOrderItem.copy_from(sales_quotation_item)
      sales_order_item.sales_order = sales_order
      sales_order.sales_order_items << sales_order_item
    end

    sales_order
  end
end
