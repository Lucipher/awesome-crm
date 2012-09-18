class AddShippingIdToBusinessPartners < ActiveRecord::Migration
  def change
    add_column :business_partners, :shipping_id, :integer
  end
end
