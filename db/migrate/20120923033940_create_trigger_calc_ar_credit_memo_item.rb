class CreateTriggerCalcArCreditMemoItem < ActiveRecord::Migration
  def up
    execute <<-SQL

      CREATE OR REPLACE
      TRIGGER calc_arcm_item
      BEFORE INSERT OR UPDATE ON AR_CREDIT_MEMO_ITEMS
      FOR EACH ROW
      DECLARE
        nett_total   NUMBER(16,9);
      BEGIN
        :new.line_total   := :new.quantity   * :new.price;
        :new.disc_total   := :new.line_total * :new.disc_rate;
        nett_total        := :new.line_total - :new.disc_total;
        :new.tax_total    := nett_total     * :new.tax_rate;
        :new.grand_total  := nett_total     + :new.tax_total;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER calc_arcm_item"
  end
end
