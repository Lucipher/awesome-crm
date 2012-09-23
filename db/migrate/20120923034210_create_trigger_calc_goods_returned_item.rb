class CreateTriggerCalcGoodsReturnedItem < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER calc_goods_returned_item
      BEFORE INSERT OR UPDATE ON GOODS_RETURNED_ITEMS
      FOR EACH ROW
      BEGIN
        :new.line_total   := :new.quantity   * :new.price;
        :new.tax_total    := :new.line_total * :new.tax_rate;
        :new.grand_total  := :new.line_total + :new.tax_total;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER calc_goods_returned_item"
  end
end
