class SalesPerson < ActiveRecord::Base
  self.table_name = "CRM.SALES_PEOPLE_VIEW"
  self.sequence_name = "CRM.SALES_PEOPLE_SEQ"
  self.primary_key = "id"

  attr_accessible :commission, :employee_id, :employee_name, :locked, :memo, :team_id, :team_name,
                  :credit_limit, :credit_balance

  belongs_to :team
  belongs_to :employee
  has_many   :assignments

  validates_presence_of :employee
end
