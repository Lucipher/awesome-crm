CREATE OR REPLACE FUNCTION limit_bp_to_assigned(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  bp_assigned_pred VARCHAR2 (400);
 BEGIN 
  bp_assigned_pred := 'id IN (
    SELECT business_partner_id FROM crm.assignments 
    WHERE sales_person_id = (
      SELECT id FROM crm.sales_people
      WHERE employee_id =
        SYS_CONTEXT(''crm_ctx'', ''employee_id'')))';        
 RETURN bp_assigned_pred;
END;