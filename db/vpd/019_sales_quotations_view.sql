CREATE OR REPLACE FORCE VIEW "CRM"."SALES_QUOTATIONS_VIEW" AS
SELECT
  sales_quotations.id                  AS id,
  sales_quotations.type                AS type,
  sales_quotations.status              AS status,
  sales_quotations.doc_date            AS doc_date,
  sales_quotations.due_date            AS due_date,
  sales_quotations.shipping_date       AS shipping_date,
  sales_quotations.total               AS total,
  sales_quotations.disc_total          AS disc_total,
  sales_quotations.tax_total           AS tax_total,
  sales_quotations.grand_total         AS grand_total,
  sales_quotations.remarks             AS remarks,
  sales_quotations.business_partner_id AS business_partner_id,
  business_partners.name               AS partner_name,
  business_partners.phone              AS partner_phone,
  business_partners.billing_address    AS partner_billing_address,
  business_partners.shipping_address   AS partner_shipping_address,
  business_partners.email              AS partner_email,
  business_partner_types.name          AS partner_type,
  shippings.name                       AS shipping,
  sales_quotations.sales_person_id     AS sales_person_id,
  employees.name                       AS sales_person_name,
  sales_quotations.created_at          AS created_at,
  sales_quotations.updated_at          AS updated_at
FROM
  sales_quotations
  INNER JOIN business_partners
    ON sales_quotations.business_partner_id = business_partners.id
  INNER JOIN business_partner_types
    ON business_partners.business_partner_type_id = business_partner_types.id
  INNER JOIN shippings
    ON business_partners.shipping_id = shippings.id
  INNER JOIN sales_people
    ON sales_quotations.sales_person_id = sales_people.id
  INNER JOIN employees
    ON sales_people.employee_id = employees.id;