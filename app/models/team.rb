class Team < ActiveRecord::Base
  self.table_name = "CRM.TEAMS_VIEW"
  self.sequence_name = "CRM.TEAMS_SEQ"
  self.primary_key = "id"

  attr_accessible :name, :remarks, :manager_id, :manager_name

  has_many :sales_persons
  belongs_to :manager, :foreign_key => 'manager_id', :class_name => 'SalesPerson'
end
