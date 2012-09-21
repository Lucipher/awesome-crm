class Department < ActiveRecord::Base
  self.table_name = "CRM.DEPARTMENTS"
  self.sequence_name = "CRM.DEPARTMENTS_SEQ"

  attr_accessible :name, :remarks

  has_many :employees
end
