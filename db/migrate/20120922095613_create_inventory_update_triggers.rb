class CreateInventoryUpdateTriggers < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE
      TRIGGER update_item_on_order
      AFTER INSERT ON GOODS_RECEIVED_ITEMS
      FOR EACH ROW
      DECLARE
        status    VARCHAR(20);
        new_qty   NUMBER(19,6);
        old_qty   NUMBER(19,6);
      BEGIN
        SELECT doc_status INTO status FROM goods_receiveds WHERE id = :new.goods_received_id;
        IF status = 'draft' THEN
          SELECT on_order INTO old_qty FROM items WHERE id = :new.item_id;
          new_qty := old_qty + :new.quantity;
          UPDATE items SET items.on_order = new_qty
            WHERE items.id = :new.item_id;
        ELSIF status = 'posted' THEN
          SELECT on_hand INTO old_qty FROM items WHERE id = :new.item_id;
          new_qty := old_qty + :new.quantity;
          UPDATE items SET items.on_hand = new_qty
            WHERE items.id = :new.item_id;
        END IF;
      END;
    SQL
  end

  def down
    execute "DROP TRIGGER update_item_on_order"
  end
end
