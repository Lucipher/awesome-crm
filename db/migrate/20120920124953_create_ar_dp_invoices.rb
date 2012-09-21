class CreateArDpInvoices < ActiveRecord::Migration
  def change
    create_table :ar_dp_invoices do |t|
      t.string :type, :limit => 20
      t.string :status, :limit => 20
      t.date :date
      t.date :due_date
      t.date :shipping_date
      t.string :currency, :limit => 3
      t.decimal :rate, :precision => 19, :scale => 6
      t.decimal :total, :precision => 19, :scale => 6
      t.decimal :disc_rate, :precision => 19, :scale => 6
      t.decimal :disc_total, :precision => 19, :scale => 6
      t.decimal :tax_rate, :precision => 19, :scale => 6
      t.decimal :tax_total, :precision => 19, :scale => 6
      t.decimal :grand_total, :precision => 19, :scale => 6
      t.string :remarks, :limit => 100
      t.integer :business_partner_id
      t.integer :sales_person_id

      t.timestamps
    end
  end
end
