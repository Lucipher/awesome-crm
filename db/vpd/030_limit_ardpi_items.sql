create or replace
FUNCTION limit_ardpi_items(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  ardpi_items_pred VARCHAR2 (800);
 BEGIN
  ardpi_items_pred := 'ar_dp_invoice_id IN (
  SELECT id FROM crm.ar_dp_invoices WHERE
    sales_person_id IN (
      SELECT id FROM crm.sales_people
      WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')
      OR team_id = (
        SELECT id FROM crm.teams
        WHERE manager_id = (
          SELECT id FROM crm.sales_people
          WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')))))
  OR (''SALES_EMP'' != SYS_CONTEXT(''crm_ctx'', ''role_code'')
  AND ''SALES_EMP'' != SYS_CONTEXT(''crm_ctx'', ''role_code''))';
  RETURN ardpi_items_pred;
END;