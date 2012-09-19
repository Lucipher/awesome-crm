class AddAttributesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :job_title, :string, :limit => 20
    add_column :employees, :department, :string, :limit => 20
  end
end
