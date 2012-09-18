class CreateSalesQuotations < ActiveRecord::Migration
  def change
    create_table :sales_quotations do |t|
      t.string :type, :limit => 20
      t.string :status, :limit => 20
      t.date :date
      t.date :due_date
      t.date :shipping_date
      t.string :currency, :limit => 3
      t.decimal :rate
      t.decimal :total
      t.decimal :disc_rate
      t.decimal :disc_total
      t.decimal :tax_rate
      t.decimal :tax_total
      t.decimal :grand_total
      t.string :remarks, :limit => 100
      t.integer :business_partner_id
      t.integer :sales_person_id

      t.timestamps
    end
  end
end
