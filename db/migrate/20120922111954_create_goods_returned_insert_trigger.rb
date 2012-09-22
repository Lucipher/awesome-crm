class CreateGoodsReturnedInsertTrigger < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE
      TRIGGER update_item_on_return
      AFTER INSERT ON GOODS_RETURNED_ITEMS
      FOR EACH ROW
      DECLARE
        status    VARCHAR(20);
        new_qty   NUMBER(19,6);
        old_qty   NUMBER(19,6);
      BEGIN
        SELECT doc_status INTO status FROM goods_returneds WHERE id = :new.goods_returned_id;

        IF status = 'posted' THEN
          SELECT on_hand INTO old_qty FROM items WHERE id = :new.item_id;
          new_qty := old_qty - :new.quantity;
          UPDATE items SET items.on_hand = new_qty
            WHERE items.id = :new.item_id;
        END IF;

      END;
    SQL
  end

  def down
    execute "DROP TRIGGER update_item_on_return"
  end
end
