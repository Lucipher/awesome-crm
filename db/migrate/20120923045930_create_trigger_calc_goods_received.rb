class CreateTriggerCalcGoodsReceived < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER calc_goods_received
      AFTER INSERT OR UPDATE ON GOODS_RECEIVED_ITEMS
      FOR EACH ROW
      DECLARE
        grand_sum   NUMBER(16,9);
        rec_id      NUMBER;
      BEGIN
        IF :old.id IS NULL THEN
          rec_id := :new.goods_received_id;
        ELSE
          rec_id := :old.goods_received_id;
        END IF;

        SELECT doc_total INTO grand_sum
        FROM goods_receiveds
        WHERE id = rec_id;

        IF :new.id IS NOT NULL THEN
          grand_sum   := grand_sum  + :new.grand_total;
        END IF;

        IF :old.id IS NOT NULL THEN
          grand_sum   := grand_sum  - :old.grand_total;
        END IF;

        UPDATE goods_receiveds SET
        doc_total       = grand_sum
        where id = rec_id;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER calc_goods_received"
  end
end
