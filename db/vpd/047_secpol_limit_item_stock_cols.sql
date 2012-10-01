BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'items',
  policy_name           => 'items_stock_only_pol',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_item_stock_cols',
  sec_relevant_cols     => 'on_hand,committed,on_order',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;