CREATE TRIGGER set_crm_employee_info_ctx_trig AFTER LOGON ON DATABASE
  BEGIN
    sysadmin_vpd.crm_ctx_pkg.set_employee_info;
  END;