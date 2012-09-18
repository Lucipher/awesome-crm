class CreateSalesOpportunityItems < ActiveRecord::Migration
  def change
    create_table :sales_opportunity_items do |t|
      t.integer :line_num
      t.string :line_status, :limit => 20
      t.date :open_date
      t.date :pred_date
      t.date :close_date
      t.string :status, :limit => 15
      t.text :memo

      t.timestamps
    end
  end
end
