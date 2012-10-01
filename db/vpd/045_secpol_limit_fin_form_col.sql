BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'ar_credit_memos_view',
  policy_name           => 'arcm_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_fin_form_col',
  sec_relevant_cols     => 'partner_shipping_address,shipping',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'ar_dp_invoices_view',
  policy_name           => 'ardpi_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_fin_form_col',
  sec_relevant_cols     => 'partner_shipping_address,shipping',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema         => 'crm',
  object_name           => 'ar_invoices_view',
  policy_name           => 'ari_cols_policy',
  function_schema       => 'sysadmin_vpd',
  policy_function       => 'limit_fin_form_col',
  sec_relevant_cols     => 'partner_shipping_address,shipping',
  sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS,
  policy_type           => dbms_rls.SHARED_STATIC);
END;