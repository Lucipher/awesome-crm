class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :gender
      t.string :phone
      t.string :email
      t.date :start_date
      t.string :status
      t.date :terminate_date
      t.text :remarks

      t.timestamps
    end
  end
end
