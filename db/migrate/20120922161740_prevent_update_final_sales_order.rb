class PreventUpdateFinalSalesOrder < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER no_update_final_sales_order
      BEFORE UPDATE OR DELETE
      ON sales_orders
      FOR EACH ROW
      WHEN (old.status = 'posted' OR old.status = 'cancelled')

      BEGIN
        RAISE_APPLICATION_ERROR( -20001, 'No alteration is allowed on a finalized record.');
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER no_update_final_sales_order"
  end
end
