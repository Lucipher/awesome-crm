class AddDeptAndJobToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :department_id, :integer
    add_column :employees, :job_title_id, :integer
  end
end
