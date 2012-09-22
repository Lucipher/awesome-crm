class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :business_partner_id
      t.integer :sales_person_id

      t.timestamps
    end
  end
end
