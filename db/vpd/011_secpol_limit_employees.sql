BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'employees',
  policy_name      => 'employees_policy',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_employees');
END;