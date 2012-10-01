CREATE OR REPLACE FORCE VIEW "CRM"."AR_DP_INVOICES_VIEW" AS
SELECT
  ar_dp_invoices.id                  AS id,
  ar_dp_invoices.type                AS type,
  ar_dp_invoices.status              AS status,
  ar_dp_invoices.doc_date            AS doc_date,
  ar_dp_invoices.due_date            AS due_date,
  ar_dp_invoices.shipping_date       AS shipping_date,
  ar_dp_invoices.total               AS total,
  ar_dp_invoices.disc_total          AS disc_total,
  ar_dp_invoices.tax_total           AS tax_total,
  ar_dp_invoices.grand_total         AS grand_total,
  ar_dp_invoices.remarks             AS remarks,
  ar_dp_invoices.business_partner_id AS business_partner_id,
  business_partners.name               AS partner_name,
  business_partners.phone              AS partner_phone,
  business_partners.billing_address    AS partner_billing_address,
  business_partners.shipping_address   AS partner_shipping_address,
  business_partners.email              AS partner_email,
  business_partner_types.name          AS partner_type,
  shippings.name                       AS shipping,
  ar_dp_invoices.sales_person_id     AS sales_person_id,
  employees.name                       AS sales_person_name,
  ar_dp_invoices.created_at          AS created_at,
  ar_dp_invoices.updated_at          AS updated_at
FROM
  ar_dp_invoices
  INNER JOIN business_partners
    ON ar_dp_invoices.business_partner_id = business_partners.id
  INNER JOIN business_partner_types
    ON business_partners.business_partner_type_id = business_partner_types.id
  INNER JOIN shippings
    ON business_partners.shipping_id = shippings.id
  INNER JOIN sales_people
    ON ar_dp_invoices.sales_person_id = sales_people.id
  INNER JOIN employees
    ON sales_people.employee_id = employees.id;