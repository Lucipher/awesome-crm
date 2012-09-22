class CreateTriggerOnSalesOrderUpdate < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER on_sales_order_status_changed
      AFTER UPDATE OF status
      ON sales_orders
      FOR EACH ROW
      WHEN (old.status = 'draft')

      DECLARE
        CURSOR cur IS
          SELECT  item_id, quantity
          FROM    sales_order_items
          WHERE   sales_order_id = :old.id;
        committed_qty   NUMBER(19,6);

      BEGIN
          FOR rec IN cur
          LOOP
            IF :new.status = 'posted' THEN
              SELECT committed INTO committed_qty FROM items where ID = rec.item_id;
              committed_qty := committed_qty + rec.quantity;
              UPDATE items SET items.committed = committed_qty
                WHERE items.id = rec.item_id;
            END IF;
          END LOOP;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER on_sales_order_status_changed"
  end
end
