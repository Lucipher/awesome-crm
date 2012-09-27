class SalesQuotation < ActiveRecord::Base
  self.table_name = "CRM.SALES_QUOTATIONS_VIEW"
  self.sequence_name = "CRM.SALES_QUOTATIONS_SEQ"
  self.primary_key = "id"

  attr_accessible :business_partner_id, :doc_date, :disc_rate, :disc_total, :due_date, :grand_total,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :sales_quotation_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :sales_quotation_items, :dependent => :destroy
  has_many :items, :through => :sales_quotation_items

  accepts_nested_attributes_for :sales_quotation_items

  validates_presence_of :business_partner, :sales_person

  class << self # Class methods
    alias :all_columns :columns
    def columns
      all_columns.reject { |c|
        %w(partner_name partner_phone partner_billing_address partner_shipping_address partner_email partner_type sales_person_name shipping).include?(c.name)
      }
    end
  end
end
