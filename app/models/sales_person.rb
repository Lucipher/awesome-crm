class SalesPerson < ActiveRecord::Base
  self.table_name = "CRM.SALES_PEOPLE"
  self.sequence_name = "CRM.SALES_PEOPLE_SEQ"

  attr_accessible :commission, :employee_id, :locked, :memo, :team_id

  belongs_to :team
  belongs_to :employee
  has_many   :assignments

  validates_presence_of :employee
end
