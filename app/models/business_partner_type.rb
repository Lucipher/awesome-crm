class BusinessPartnerType < ActiveRecord::Base
  self.table_name = "CRM.BUSINESS_PARTNER_TYPES"
  self.sequence_name = "CRM.BUSINESS_PARTNER_TYPES_SEQ"

  attr_accessible :name, :remarks

  has_many :business_partners

  validates_presence_of :name

end
