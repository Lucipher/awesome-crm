class RemoveGroupIdFromBusinessPartners < ActiveRecord::Migration
  def up
    remove_column :business_partners, :group_id
  end

  def down
    add_column :business_partners, :group_id, :integer
  end
end
