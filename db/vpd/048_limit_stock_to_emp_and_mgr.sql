CREATE OR REPLACE FUNCTION limit_stock_to_emp_and_mgr(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  pred VARCHAR2 (400);
 BEGIN
  pred := 'employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')
           OR ''STOCK_MGR'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')';
  RETURN pred;
END;