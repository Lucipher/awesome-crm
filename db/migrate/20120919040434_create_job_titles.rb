class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.string :name,             :limit => 20
      t.string :remarks,          :limit => 100
      t.integer :department_id

      t.timestamps
    end
  end
end
