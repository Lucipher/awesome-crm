class Team < ActiveRecord::Base
  self.table_name = "CRM.TEAMS"
  self.sequence_name = "CRM.TEAMS_SEQ"

  attr_accessible :name, :remarks, :manager_id

  has_many :sales_persons
  belongs_to :manager, :foreign_key => 'manager_id', :class_name => 'SalesPerson'
end
