class BusinessPartner < ActiveRecord::Base
  set_table_name "CRM.BUSINESS_PARTNERS"
  self.sequence_name = "CRM.BUSINESS_PARTNERS_SEQ"

  attr_accessible :billing_address, :email, :name, :phone, :shipping_address
end
