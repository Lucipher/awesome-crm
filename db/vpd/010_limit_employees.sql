CREATE OR REPLACE FUNCTION limit_employees(
  schema_p    IN VARCHAR2,
  table_p     IN VARCHAR2)
 RETURN VARCHAR2
 AS
  employees_pred VARCHAR2 (800);
 BEGIN
  employees_pred := 'id = SYS_CONTEXT(''crm_ctx'', ''employee_id'')
    OR id IN (
      SELECT employee_id FROM crm.sales_people
      WHERE team_id = (
        SELECT id FROM crm.teams
        WHERE manager_id IN (
          SELECT id FROM crm.sales_people
          WHERE employee_id = SYS_CONTEXT(''crm_ctx'', ''employee_id''))))
    OR department_id = (
      SELECT id FROM crm.departments
      WHERE manager_id = SYS_CONTEXT(''crm_ctx'', ''employee_id''))';
  RETURN employees_pred;
END;