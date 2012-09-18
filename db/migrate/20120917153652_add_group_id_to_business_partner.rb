class AddGroupIdToBusinessPartner < ActiveRecord::Migration
  def change
    add_column :business_partners, :group_id, :integer
  end
end
