class AddRefIdToArCreditMemoItems < ActiveRecord::Migration
  def change
    add_column :ar_credit_memo_items, :ref_id, :integer
  end
end
