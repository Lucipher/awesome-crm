CREATE OR REPLACE FORCE VIEW "CRM"."AR_CREDIT_MEMOS_VIEW" AS
SELECT
  ar_credit_memos.id                  AS id,
  ar_credit_memos.type                AS type,
  ar_credit_memos.status              AS status,
  ar_credit_memos.doc_date            AS doc_date,
  ar_credit_memos.due_date            AS due_date,
  ar_credit_memos.shipping_date       AS shipping_date,
  ar_credit_memos.total               AS total,
  ar_credit_memos.disc_total          AS disc_total,
  ar_credit_memos.tax_total           AS tax_total,
  ar_credit_memos.grand_total         AS grand_total,
  ar_credit_memos.remarks             AS remarks,
  ar_credit_memos.business_partner_id AS business_partner_id,
  business_partners.name               AS partner_name,
  business_partners.phone              AS partner_phone,
  business_partners.billing_address    AS partner_billing_address,
  business_partners.shipping_address   AS partner_shipping_address,
  business_partners.email              AS partner_email,
  business_partner_types.name          AS partner_type,
  shippings.name                       AS shipping,
  ar_credit_memos.sales_person_id     AS sales_person_id,
  employees.name                       AS sales_person_name,
  ar_credit_memos.created_at          AS created_at,
  ar_credit_memos.updated_at          AS updated_at
FROM
  ar_credit_memos
  INNER JOIN business_partners
    ON ar_credit_memos.business_partner_id = business_partners.id
  INNER JOIN business_partner_types
    ON business_partners.business_partner_type_id = business_partner_types.id
  INNER JOIN shippings
    ON business_partners.shipping_id = shippings.id
  INNER JOIN sales_people
    ON ar_credit_memos.sales_person_id = sales_people.id
  INNER JOIN employees
    ON sales_people.employee_id = employees.id;