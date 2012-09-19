class Department < ActiveRecord::Base
  set_table_name "CRM.DEPARTMENTS"
  self.sequence_name = "CRM.DEPARTMENTS_SEQ"

  attr_accessible :name, :remarks

  has_many :employees
end
