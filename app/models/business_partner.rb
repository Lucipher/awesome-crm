class BusinessPartner < ActiveRecord::Base
  self.table_name = "CRM.BUSINESS_PARTNERS"
  self.sequence_name = "CRM.BUSINESS_PARTNERS_SEQ"

  attr_accessible :billing_address, :email, :name, :phone, :shipping_address, :business_partner_type_id, :shipping_id

  belongs_to :shipping
  belongs_to :business_partner_type

  has_many :sales_opportunities
  has_many :sales_quotations
  has_many :sales_orders
  has_many :delivery_orders
  has_many :sales_returns
  has_many :ar_invoices
  has_many :ar_credit_memos
  has_many :ar_down_payment_invoices
  has_many :assignments

  validates_presence_of :name

end
