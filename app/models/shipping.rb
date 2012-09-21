class Shipping < ActiveRecord::Base
  self.table_name = "CRM.SHIPPINGS"
  self.sequence_name = "CRM.SHIPPINGS_SEQ"

  attr_accessible :name, :remarks

  has_many :business_partners

  validates_presence_of :name

end
