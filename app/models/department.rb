class Department < ActiveRecord::Base
  self.table_name = "CRM.DEPARTMENTS"
  self.sequence_name = "CRM.DEPARTMENTS_SEQ"

  attr_accessible :name, :remarks, :manager_id

  has_many :employees
  belongs_to :manager, :foreign_key => 'manager_id', :class_name => 'Employee'
end
