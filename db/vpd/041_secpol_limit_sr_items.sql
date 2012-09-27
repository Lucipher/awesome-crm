BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_return_items',
  policy_name      => 'sr_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_sr_items',
  policy_type      => dbms_rls.STATIC
 );
END;