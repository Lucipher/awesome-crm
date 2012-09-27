create or replace
FUNCTION limit_sr_items(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  sr_items_pred VARCHAR2 (800);
 BEGIN
  sr_items_pred := 'sales_return_id IN (
  SELECT id FROM crm.sales_returns WHERE
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
  RETURN sr_items_pred;
END;