class CreateBusinessPartnerTypes < ActiveRecord::Migration
  def change
    create_table :business_partner_types do |t|
      t.string :name
      t.text :remarks

      t.timestamps
    end
  end
end
