class AddRefIdToArInvoiceItem < ActiveRecord::Migration
  def change
    add_column :ar_invoice_items, :ref_id, :integer
  end
end
