class CreateTriggerOnSalesOrderInsert < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE
      TRIGGER on_sales_order_insert
      AFTER INSERT ON SALES_ORDER_ITEMS
      FOR EACH ROW
      DECLARE
        stat      VARCHAR(20);
        new_qty   NUMBER(19,6);
        old_qty   NUMBER(19,6);
      BEGIN
        SELECT status INTO stat FROM sales_orders WHERE id = :new.sales_order_id;

        IF stat = 'posted' THEN
          SELECT committed INTO old_qty FROM items WHERE id = :new.item_id;
          new_qty := old_qty + :new.quantity;
          UPDATE items SET items.committed = new_qty
            WHERE items.id = :new.item_id;
        END IF;

      END;
    SQL
  end

  def down
    execute "DROP TRIGGER on_sales_order_insert"
  end
end
