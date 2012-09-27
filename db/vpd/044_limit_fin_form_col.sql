CREATE OR REPLACE FUNCTION limit_fin_form_col(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  form_col_pred VARCHAR2 (400);
 BEGIN
  form_col_pred := '
       ''SALES_MGR'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')
    OR ''SALES_EMP'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')
    OR ''STOCK_EMP'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')
    OR ''STOCK_MGR'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')';
  RETURN form_col_pred;
END;