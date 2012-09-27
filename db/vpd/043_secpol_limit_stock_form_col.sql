BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'delivery_orders_view',
  policy_name           => 'do_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_form_col',
  sec_relevant_cols     => 'total,disc_total,tax_total,grand_total',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'delivery_order_items',
  policy_name           => 'doi_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_form_col',
  sec_relevant_cols     => 'price,disc_rate,disc_total,line_total,tax_rate,tax_total,grand_total',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'sales_returns_view',
  policy_name           => 'sr_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_form_col',
  sec_relevant_cols     => 'total,disc_total,tax_total,grand_total',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'sales_return_items',
  policy_name           => 'sri_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_stock_form_col',
  sec_relevant_cols     => 'price,disc_rate,disc_total,line_total,tax_rate,tax_total,grand_total',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;