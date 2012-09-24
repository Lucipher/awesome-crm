class AddRoleCodeToJobTitle < ActiveRecord::Migration
  def change
    add_column :job_titles, :role_code, :string
    add_index  :job_titles, :role_code
  end
end
