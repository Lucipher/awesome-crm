CREATE OR REPLACE FUNCTION limit_to_self(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  users_pred VARCHAR2 (400);
 BEGIN
  users_pred := 'employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')';
 RETURN users_pred;
END;