class CreateTriggerOnDlvOrderUpdate < ActiveRecord::Migration
  def up
    execute <<-SQL

        CREATE OR REPLACE
        TRIGGER on_dlv_order_status_changed
        AFTER UPDATE OF status
        ON delivery_orders
        FOR EACH ROW
        WHEN (old.status = 'draft')

        DECLARE
          CURSOR cur IS
            SELECT  item_id, quantity
            FROM    delivery_order_items
            WHERE   delivery_order_id = :old.id;
          committed_qty   NUMBER(19,6);
          on_hand_qty     NUMBER(19,6);

        BEGIN
            FOR rec IN cur
            LOOP
              IF :new.status = 'posted' THEN
                SELECT committed INTO committed_qty FROM items where ID = rec.item_id;
                committed_qty := committed_qty - rec.quantity;

                SELECT on_hand INTO on_hand_qty FROM items where ID = rec.item_id;
                on_hand_qty := on_hand_qty - rec.quantity;

                UPDATE items SET items.committed = committed_qty
                  WHERE items.id = rec.item_id;

                UPDATE items SET items.on_hand = on_hand_qty
                  WHERE items.id = rec.item_id;
              END IF;
            END LOOP;
        END;

    SQL
  end

  def down
    execute "DROP TRIGGER on_dlv_order_status_changed"
  end
end
