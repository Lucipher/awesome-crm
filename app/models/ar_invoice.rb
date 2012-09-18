class ArInvoice < ActiveRecord::Base
  set_table_name "CRM.AR_INVOICES"
  self.sequence_name = "CRM.AR_INVOICES_SEQ"

  attr_accessible :business_partner_id, :currency, :date, :disc_rate, :disc_total, :due_date, :grand_total, :rate,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :ar_invoice_items

  accepts_nested_attributes_for :ar_invoice_items
end
