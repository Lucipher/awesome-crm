class RemoveLastPurchaseCurrencyFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :last_purchase_currency
  end

  def down
    add_column :items, :last_purchase_currency, :string
  end
end
