class CreateTriggerCalcSalesQuotation < ActiveRecord::Migration
  def up
    execute <<-SQL

      create or replace
      TRIGGER calc_sales_quotation
      AFTER INSERT OR UPDATE ON SALES_QUOTATION_ITEMS
      FOR EACH ROW
      DECLARE
        line_sum    NUMBER(16,9);
        disc_sum    NUMBER(16,9);
        tax_sum     NUMBER(16,9);
        grand_sum   NUMBER(16,9);
        do_id       NUMBER;
      BEGIN
        IF :old.id IS NULL THEN
          do_id := :new.sales_quotation_id;
        ELSE
          do_id := :old.sales_quotation_id;
        END IF;

        SELECT total, disc_total, tax_total, grand_total INTO line_sum, disc_sum, tax_sum, grand_sum
        FROM sales_quotations
        WHERE id = do_id;

        IF :new.id IS NOT NULL THEN
          line_sum    := line_sum   + :new.line_total;
          disc_sum    := disc_sum   + :new.disc_total;
          tax_sum     := tax_sum    + :new.tax_total;
          grand_sum   := grand_sum  + :new.grand_total;
        END IF;

        IF :old.id IS NOT NULL THEN
          line_sum    := line_sum   - :old.line_total;
          disc_sum    := disc_sum   - :old.disc_total;
          tax_sum     := tax_sum    - :old.tax_total;
          grand_sum   := grand_sum  - :old.grand_total;
        END IF;

        UPDATE sales_quotations SET
        total       = line_sum,
        disc_total  = disc_sum,
        tax_total   = tax_sum,
        grand_total = grand_sum
        where id = do_id;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER calc_sales_quotation"
  end
end
