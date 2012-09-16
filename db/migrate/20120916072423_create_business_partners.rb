class CreateBusinessPartners < ActiveRecord::Migration
  def change
    create_table :business_partners do |t|
      t.string :name
      t.string :phone
      t.text :billing_address
      t.text :shipping_address
      t.string :email

      t.timestamps
    end
  end
end
