class AddRefIdToArDpInvoiceItems < ActiveRecord::Migration
  def change
    add_column :ar_dp_invoice_items, :ref_id, :integer
  end
end
