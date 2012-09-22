class CreateTriggerOnDlvOrderInsert < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE
      TRIGGER on_delivery_order_insert
      AFTER INSERT ON DELIVERY_ORDER_ITEMS
      FOR EACH ROW
      DECLARE
        stat           VARCHAR(20);
        comm_new_qty   NUMBER(19,6);
        comm_old_qty   NUMBER(19,6);
        hand_new_qty   NUMBER(19,6);
        hand_old_qty   NUMBER(19,6);
      BEGIN
        SELECT status INTO stat FROM delivery_orders WHERE id = :new.delivery_order_id;

        IF stat = 'posted' THEN
          SELECT committed INTO comm_old_qty FROM items WHERE id = :new.item_id;
          comm_new_qty := comm_old_qty - :new.quantity;

          SELECT on_hand INTO hand_old_qty FROM items WHERE id = :new.item_id;
          hand_new_qty := hand_old_qty - :new.quantity;

          UPDATE items SET items.committed = comm_new_qty
            WHERE items.id = :new.item_id;

          UPDATE items SET items.on_hand = hand_new_qty
            WHERE items.id = :new.item_id;
        END IF;

      END;
    SQL
  end

  def down
    execute "DROP TRIGGER on_delivery_order_insert"
  end
end
