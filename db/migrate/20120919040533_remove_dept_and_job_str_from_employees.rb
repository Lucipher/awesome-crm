class RemoveDeptAndJobStrFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :department
    remove_column :employees, :job_title
  end

  def down
    add_column :employees, :job_title, :string
    add_column :employees, :department, :string
  end
end
