class CreateTriggerCalcGoodsReceivedItem < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER calc_goods_received_item
      BEFORE INSERT OR UPDATE ON GOODS_RECEIVED_ITEMS
      FOR EACH ROW
      BEGIN
        :new.line_total   := :new.quantity   * :new.price;
        :new.tax_total    := :new.line_total * :new.tax_rate;
        :new.grand_total  := :new.line_total + :new.tax_total;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER calc_goods_received_item"
  end
end
