class SalesQuotation < ActiveRecord::Base
  self.table_name = "CRM.SALES_QUOTATIONS"
  self.sequence_name = "CRM.SALES_QUOTATIONS_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :sales_quotation_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :sales_quotation_items, :dependent => :destroy
  has_many :items, :through => :sales_quotation_items

  accepts_nested_attributes_for :sales_quotation_items

  validates_presence_of :business_partner, :sales_person
end
