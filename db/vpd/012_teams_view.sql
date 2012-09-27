CREATE VIEW teams_view AS
  SELECT
    crm.teams.id AS id,
    crm.teams.name AS name,
    crm.teams.remarks AS remarks,
    crm.teams.created_at AS created_at,
    crm.teams.updated_at AS updated_at,
    crm.teams.manager_id AS manager_id,
    crm.employees.name AS manager_name
  FROM
    crm.teams
    INNER JOIN crm.sales_people
      ON crm.teams.manager_id = crm.sales_people.id
    INNER JOIN crm.employees
      ON crm.sales_people.employee_id = crm.employees.id;