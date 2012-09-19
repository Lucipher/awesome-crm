class RemoveNameFromSalesPeople < ActiveRecord::Migration
  def up
    remove_column :sales_people, :name
  end

  def down
    add_column :sales_people, :name, :string
  end
end
