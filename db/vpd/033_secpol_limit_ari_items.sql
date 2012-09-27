BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_invoice_items',
  policy_name      => 'ari_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_ari_items',
  policy_type      => dbms_rls.STATIC
 );
END;