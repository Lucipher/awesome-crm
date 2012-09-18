class Team < ActiveRecord::Base
  set_table_name "CRM.TEAMS"
  self.sequence_name = "CRM.TEAMS_SEQ"

  attr_accessible :name, :remarks

  has_many :sales_persons
end
