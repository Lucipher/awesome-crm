class JobTitle < ActiveRecord::Base
  self.table_name = "CRM.JOB_TITLES"
  self.sequence_name = "CRM.JOB_TITLES_SEQ"

  attr_accessible :name, :role_code, :remarks

  has_many :employees
end
