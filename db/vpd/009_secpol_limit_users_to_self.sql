BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'users',
  policy_name      => 'users_policy',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_users');
END;