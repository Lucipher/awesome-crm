class SalesOpportunity < ActiveRecord::Base
  self.table_name = "CRM.SALES_OPPORTUNITIES"
  self.sequence_name = "CRM.SALES_OPPORTUNITIES_SEQ"

  attr_accessible :business_partner_id, :close_date, :doc_date, :memo, :open_date, :pred_date,
                  :sales_person_id, :status, :sales_opportunity_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person
  has_many :sales_opportunity_items

  accepts_nested_attributes_for :sales_opportunity_items

  validates_presence_of :business_partner, :sales_person
end
