BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_people_view',
  policy_name      => 'sales_people_policy',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_sp_to_team');
END;