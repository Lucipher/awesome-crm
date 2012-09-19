class Group < ActiveRecord::Base
  set_table_name "CRM.GROUPS"
  self.sequence_name = "CRM.GROUPS_SEQ"

  has_many :items

  attr_accessible :description, :name
end
