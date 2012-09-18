class AddBusinessPartnerTypeIdToBusinessPartners < ActiveRecord::Migration
  def change
    add_column :business_partners, :business_partner_type_id, :integer
  end
end
