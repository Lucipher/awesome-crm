class AddRefIdToSalesQuotationItem < ActiveRecord::Migration
  def up
    add_column :sales_quotation_items, :ref_id, :integer
  end

  def down
    remove_column :sales_quotation_items, :ref_id
  end
end
