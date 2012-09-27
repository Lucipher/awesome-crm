BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'sales_people_view',
  policy_name           => 'sp_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_sp_cols',
  sec_relevant_cols     => 'commission,credit_limit,credit_balance',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS);
END;