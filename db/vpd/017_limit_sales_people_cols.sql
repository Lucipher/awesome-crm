CREATE OR REPLACE FUNCTION limit_sp_cols(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  sp_cols_pred VARCHAR2 (400);
 BEGIN
  sp_cols_pred := 'id IN (
    SELECT id FROM crm.sales_people
    WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')
    OR team_id = (
      SELECT id FROM crm.teams
      WHERE manager_id = (
        SELECT id FROM crm.sales_people
        WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id''))))
    OR ''HR_MGR'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')
    OR ''HR_EMP'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')';
  RETURN sp_cols_pred;
END;