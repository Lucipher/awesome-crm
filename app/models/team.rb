class Team < ActiveRecord::Base
  self.table_name = "CRM.TEAMS"
  self.sequence_name = "CRM.TEAMS_SEQ"

  attr_accessible :name, :remarks

  has_many :sales_persons
end
