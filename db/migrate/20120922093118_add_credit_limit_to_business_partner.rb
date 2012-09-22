class AddCreditLimitToBusinessPartner < ActiveRecord::Migration
  def change
    add_column :business_partners, :credit_limit, :decimal, :precision => 19, :scale => 6
    add_column :business_partners, :credit_balance, :decimal, :precision => 19, :scale => 6
  end
end
