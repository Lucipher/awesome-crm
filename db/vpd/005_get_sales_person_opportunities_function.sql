CREATE OR REPLACE FUNCTION get_sales_person_opportunities(
  schema_p  IN VARCHAR2,
  table_p   IN VARCHAR2)
 RETURN VARCHAR2
 AS
  sales_opp_pred VARCHAR2 (400);
 BEGIN
  sales_opp_pred := 'sales_person_id = SYS_CONTEXT(''crm_ctx'', ''sales_person_id'')';
 RETURN sales_opp_pred;
END;