class Employee < ActiveRecord::Base
  set_table_name "CRM.EMPLOYEES"
  self.sequence_name = "CRM.EMPLOYEES_SEQ"

  attr_accessible :email, :gender, :name, :phone, :remarks, :start_date, :status, :terminate_date

  has_one :sales_person, :dependent => :destroy
  has_many :goods_receiveds
  has_many :goods_returneds
end
