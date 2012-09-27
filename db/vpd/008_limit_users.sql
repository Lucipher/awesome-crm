CREATE OR REPLACE FUNCTION limit_users(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  users_pred VARCHAR2 (400);
 BEGIN
  users_pred := 'id = SYS_CONTEXT(''crm_ctx'', ''user_id'')';
  RETURN users_pred;
END;