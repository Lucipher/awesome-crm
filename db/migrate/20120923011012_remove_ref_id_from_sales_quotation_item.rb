class RemoveRefIdFromSalesQuotationItem < ActiveRecord::Migration
  def up
    remove_column :sales_quotation_items, :ref_id
  end

  def down
    add_column :sales_quotation_items, :ref_id, :integer
  end
end
