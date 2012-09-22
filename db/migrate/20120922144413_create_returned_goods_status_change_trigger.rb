class CreateReturnedGoodsStatusChangeTrigger < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER on_ret_goods_status_changed
      AFTER UPDATE OF doc_status
      ON goods_returneds
      FOR EACH ROW
      WHEN (old.doc_status = 'draft')

      DECLARE
        CURSOR cur IS
          SELECT  item_id, quantity
          FROM    goods_returned_items
          WHERE   goods_returned_id = :old.id;
        on_hand_qty   NUMBER(19,6);
        on_order_qty  NUMBER(19,6);

      BEGIN
          FOR rec IN cur
          LOOP
            IF :new.doc_status = 'posted' THEN
              SELECT on_hand INTO on_hand_qty FROM items where ID = rec.item_id;
              on_hand_qty := on_hand_qty - rec.quantity;
              UPDATE items SET items.on_hand = on_hand_qty
                WHERE items.id = rec.item_id;
            END IF;
          END LOOP;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER on_ret_goods_status_changed"
  end
end
