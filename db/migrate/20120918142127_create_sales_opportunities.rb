class CreateSalesOpportunities < ActiveRecord::Migration
  def change
    create_table :sales_opportunities do |t|
      t.date :doc_date
      t.date :open_date
      t.date :pred_date
      t.date :close_date
      t.string :status, :limit => 15
      t.text :memo
      t.integer :business_partner_id
      t.integer :sales_person_id

      t.timestamps
    end
  end
end
