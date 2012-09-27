BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_quotation_items',
  policy_name      => 'sq_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_sq_items',
  policy_type      => dbms_rls.STATIC
 );
END;