BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_order_items',
  policy_name      => 'sord_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_sord_items',
  policy_type      => dbms_rls.STATIC
 );
END;