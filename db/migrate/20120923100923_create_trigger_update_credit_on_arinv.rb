class CreateTriggerUpdateCreditOnArinv < ActiveRecord::Migration
  def up
    execute <<-SQL

      create or replace
      TRIGGER update_credit_on_arinv
      AFTER UPDATE ON AR_INVOICES
      FOR EACH ROW
      WHEN (new.status = 'posted')
      DECLARE
        bp_limit    NUMBER(16,9);
        bp_balance  NUMBER(16,9);
        sp_limit    NUMBER(16,9);
        sp_balance  NUMBER(16,9);
      BEGIN
        SELECT credit_limit, credit_balance INTO bp_limit, bp_balance
        FROM business_partners
        WHERE id = :new.business_partner_id;

        SELECT credit_limit, credit_balance INTO sp_limit, sp_balance
        FROM sales_people
        WHERE id = :new.sales_person_id;

        bp_balance := bp_balance - :new.grand_total;
        sp_balance := sp_balance - :new.grand_total;

        UPDATE business_partners SET credit_balance = bp_balance
        WHERE id = :new.business_partner_id;

        UPDATE sales_people SET credit_balance = sp_balance
        WHERE id = :new.sales_person_id;
      END;

    SQL
  end

  def down
    execute "DROP TRIGGER update_credit_on_arinv"
  end
end
