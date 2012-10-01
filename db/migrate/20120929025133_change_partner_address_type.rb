class ChangePartnerAddressType < ActiveRecord::Migration
  def up
    remove_column :business_partners, :billing_address
    add_column    :business_partners, :billing_address, :string, :limit => 255

    remove_column :business_partners, :shipping_address
    add_column    :business_partners, :shipping_address, :string, :limit => 255
  end

  def down
    remove_column :business_partners, :billing_address
    add_column    :business_partners, :billing_address, :text

    remove_column :business_partners, :shipping_address
    add_column    :business_partners, :shipping_address, :text
  end
end
