class AddRefIdToSalesReturnItems < ActiveRecord::Migration
  def change
    add_column :sales_return_items, :ref_id, :integer
  end
end
