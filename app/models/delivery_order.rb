class DeliveryOrder < ActiveRecord::Base
  self.table_name = "CRM.DELIVERY_ORDERS_VIEW"
  self.sequence_name = "CRM.DELIVERY_ORDERS_SEQ"
  self.primary_key = "id"

  attr_accessible :business_partner_id, :doc_date, :disc_rate, :disc_total, :due_date, :grand_total,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :delivery_order_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :delivery_order_items, :dependent => :destroy
  has_many :items, :through => :delivery_order_items

  accepts_nested_attributes_for :delivery_order_items

  validates_presence_of :business_partner, :sales_person

  class << self # Class methods
    alias :all_columns :columns
    def columns
      all_columns.reject { |c|
        %w(partner_name partner_phone partner_billing_address partner_shipping_address partner_email partner_type sales_person_name shipping).include?(c.name)
      }
    end
  end

  def self.copy_from(src)
    inst = DeliveryOrder.new

    inst.id                 = DeliveryOrder.connection.select_value("SELECT crm.delivery_orders_seq.nextval FROM DUAL")
    inst.business_partner   = src.business_partner
    inst.doc_date           = src.doc_date
    inst.disc_total         = 0
    inst.due_date           = src.due_date
    inst.grand_total        = 0
    inst.remarks            = src.remarks
    inst.sales_person       = src.sales_person
    inst.shipping_date      = src.shipping_date
    inst.status             = 'draft'
    inst.tax_total          = 0
    inst.total              = 0
    inst.type               = src.type

    src.sales_order_items.each do |src_item|
      inst_item = DeliveryOrderItem.copy_from(src_item)
      inst_item.delivery_order = inst
      inst.delivery_order_items << inst_item
    end

    inst
  end
end
