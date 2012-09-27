CREATE OR REPLACE VIEW SALES_PEOPLE_VIEW AS
  SELECT
    sales_people.id             AS id,
    sales_people.memo           AS memo,
    sales_people.commission     AS commission,
    sales_people.locked         AS locked,
    sales_people.team_id        AS team_id,
    teams.name                  AS team_name,
    sales_people.employee_id    AS employee_id,
    employees.name              AS employee_name,
    sales_people.created_at     AS created_at,
    sales_people.updated_at     AS updated_at,
    sales_people.credit_limit   AS credit_limit,
    sales_people.credit_balance AS credit_balance
  FROM
    sales_people
    INNER JOIN teams on sales_people.team_id = teams.id
    INNER JOIN employees on sales_people.employee_id = employees.id;