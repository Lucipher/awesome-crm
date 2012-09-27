BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'delivery_order_items',
  policy_name      => 'do_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_do_items',
  policy_type      => dbms_rls.STATIC
 );
END;