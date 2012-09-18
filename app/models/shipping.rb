class Shipping < ActiveRecord::Base
  set_table_name "CRM.SHIPPINGS"
  self.sequence_name = "CRM.SHIPPINGS_SEQ"

  attr_accessible :name, :remarks

  has_many :business_partners
end
