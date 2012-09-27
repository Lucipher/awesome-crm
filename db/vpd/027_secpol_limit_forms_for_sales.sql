BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_credit_memos_view',
  policy_name      => 'ar_credit_memo_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_dp_invoices_view',
  policy_name      => 'ar_dp_invoice_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'ar_invoices_view',
  policy_name      => 'ar_invoice_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_orders_view',
  policy_name      => 'sales_order_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'delivery_orders_view',
  policy_name      => 'delivery_order_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_quotations_view',
  policy_name      => 'sales_quotation_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;
/
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'sales_returns_view',
  policy_name      => 'sales_return_sales',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_forms_for_sales',
  policy_type      => dbms_rls.SHARED_STATIC
 );
END;