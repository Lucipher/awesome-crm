CREATE TRIGGER set_crm_userid_ctx_trig AFTER LOGON ON DATABASE
  BEGIN
    sysadmin_vpd.crm_ctx_pkg.set_userid;
  END;