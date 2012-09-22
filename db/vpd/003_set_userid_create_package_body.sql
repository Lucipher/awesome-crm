CREATE OR REPLACE PACKAGE BODY crm_ctx_pkg IS
  PROCEDURE set_userid
  AS
    userid NUMBER;
  BEGIN
    SELECT id INTO userid FROM crm.users
        WHERE db_username = SYS_CONTEXT('USERENV', 'SESSION_USER');
    DBMS_SESSION.SET_CONTEXT('crm_ctx', 'user_id', userid);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
  END set_userid;
END;