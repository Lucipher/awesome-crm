class SalesPerson < ActiveRecord::Base
  set_table_name "CRM.SALES_PEOPLE"
  self.sequence_name = "CRM.SALES_PEOPLE_SEQ"

  attr_accessible :commission, :employee_id, :locked, :memo, :name, :team_id

  belongs_to :team
  belongs_to :employee
end
