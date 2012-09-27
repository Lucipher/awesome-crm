CREATE OR REPLACE FUNCTION limit_sp_to_team(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  sp_team_pred VARCHAR2 (400);
 BEGIN
  sp_team_pred := 'id IN (
  SELECT id FROM crm.sales_people
  WHERE team_id = (
    SELECT team_id FROM crm.sales_people
    WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')))';
  RETURN sp_team_pred;
END;