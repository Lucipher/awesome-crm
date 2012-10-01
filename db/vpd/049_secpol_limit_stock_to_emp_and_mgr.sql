BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'goods_receiveds',
  policy_name           => 'gr_emp_mgr_pol',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_to_emp_and_mgr',
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'goods_returneds',
  policy_name           => 'gr_emp_mgr_pol',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_to_emp_and_mgr',
  policy_type           => dbms_rls.SHARED_STATIC);
END;