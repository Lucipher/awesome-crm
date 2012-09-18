class CreateSalesPeople < ActiveRecord::Migration
  def change
    create_table :sales_people do |t|
      t.string :name
      t.text :memo
      t.decimal :commission
      t.boolean :locked
      t.integer :team_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
