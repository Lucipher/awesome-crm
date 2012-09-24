BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'crm',
  object_name      => 'business_partners',
  policy_name      => 'bp_assigned_policy',
  function_schema  => 'sysadmin_vpd',
  policy_function  => 'limit_bp_to_assigned',
  statement_types  => 'select');
END;