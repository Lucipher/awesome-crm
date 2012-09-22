class PreventEditOfFinalRetGoods < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER no_update_final_ret_goods
      BEFORE UPDATE OR DELETE
      ON goods_returneds
      FOR EACH ROW
      WHEN (old.doc_status = 'posted' OR old.doc_status = 'cancelled')

      BEGIN
        RAISE_APPLICATION_ERROR( -20001, 'No alteration is allowed on a finalized record.');
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER no_update_final_ret_goods"
  end
end
