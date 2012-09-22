class Assignment < ActiveRecord::Base
  self.table_name = "CRM.ASSIGNMENTS"
  self.sequence_name = "CRM.ASSIGNMENTS_SEQ"

  attr_accessible :business_partner_id, :sales_person_id

  belongs_to  :sales_person
  belongs_to  :business_partner

end
