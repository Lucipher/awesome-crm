BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_credit_memo_items',
  policy_name      => 'arcm_items',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_arcm_items',
  policy_type      => dbms_rls.STATIC
 );
END;