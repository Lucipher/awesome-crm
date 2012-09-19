class RemoveDepartmentFromJobTitle < ActiveRecord::Migration
  def up
    remove_column :job_titles, :department_id
  end

  def down
    add_column :job_titles, :department_id, :integer
  end
end
