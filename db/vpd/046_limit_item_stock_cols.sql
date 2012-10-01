CREATE OR REPLACE FUNCTION limit_item_stock_cols(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  pred VARCHAR2 (400);
 BEGIN
  pred := '
       ''STOCK_MGR'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')
    OR ''STOCK_EMP'' = SYS_CONTEXT(''crm_ctx'', ''role_code'')';
  RETURN pred;
END;