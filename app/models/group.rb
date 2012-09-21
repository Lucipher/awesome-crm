class Group < ActiveRecord::Base
  self.table_name = "CRM.GROUPS"
  self.sequence_name = "CRM.GROUPS_SEQ"

  has_many :items

  attr_accessible :description, :name
end
