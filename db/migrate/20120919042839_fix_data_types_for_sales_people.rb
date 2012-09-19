class FixDataTypesForSalesPeople < ActiveRecord::Migration
  def up
    change_column :sales_people, :commission, :decimal, :precision => 19, :scale => 6
  end

  def down
    change_column :sales_people, :commission, :decimal
  end
end
