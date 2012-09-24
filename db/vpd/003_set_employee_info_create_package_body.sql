CREATE OR REPLACE PACKAGE BODY crm_ctx_pkg IS
  PROCEDURE set_employee_info
  AS
    employeeid NUMBER;
    rolecode   VARCHAR2(20);
  BEGIN
    SELECT employee_id INTO employeeid
      FROM crm.users
      WHERE db_username = SYS_CONTEXT('USERENV', 'SESSION_USER');

    DBMS_SESSION.SET_CONTEXT('crm_ctx', 'employee_id', employeeid);

    SELECT role_code INTO rolecode
      FROM crm.employees INNER JOIN crm.job_titles
        ON crm.employees.job_title_id = crm.job_titles.id
      WHERE crm.employees.id = employeeid;

    DBMS_SESSION.SET_CONTEXT('crm_ctx', 'role_code', rolecode);

  EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
  END set_employee_info;
END;