class AddCreditLimitToSalesPerson < ActiveRecord::Migration
  def change
    add_column :sales_people, :credit_limit, :decimal, :precision => 19, :scale => 6
    add_column :sales_people, :credit_balance, :decimal, :precision => 19, :scale => 6
  end
end
