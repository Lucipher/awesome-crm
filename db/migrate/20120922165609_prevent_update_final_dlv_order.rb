class PreventUpdateFinalDlvOrder < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER no_update_final_dlv_order
      BEFORE UPDATE OR DELETE
      ON delivery_orders
      FOR EACH ROW
      WHEN (old.status = 'posted' OR old.status = 'cancelled')

      BEGIN
        RAISE_APPLICATION_ERROR( -20001, 'No alteration is allowed on a finalized record.');
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER no_update_final_dlv_order"
  end
end
