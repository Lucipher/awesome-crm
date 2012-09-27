BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_dp_invoice_items',
  policy_name      => 'ardpi_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_ardpi_items',
  policy_type      => dbms_rls.STATIC
 );
END;