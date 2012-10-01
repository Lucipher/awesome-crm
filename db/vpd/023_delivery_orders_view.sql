CREATE OR REPLACE FORCE VIEW "CRM"."DELIVERY_ORDERS_VIEW" AS
SELECT
  delivery_orders.id                  AS id,
  delivery_orders.type                AS type,
  delivery_orders.status              AS status,
  delivery_orders.doc_date            AS doc_date,
  delivery_orders.due_date            AS due_date,
  delivery_orders.shipping_date       AS shipping_date,
  delivery_orders.total               AS total,
  delivery_orders.disc_total          AS disc_total,
  delivery_orders.tax_total           AS tax_total,
  delivery_orders.grand_total         AS grand_total,
  delivery_orders.remarks             AS remarks,
  delivery_orders.business_partner_id AS business_partner_id,
  business_partners.name               AS partner_name,
  business_partners.phone              AS partner_phone,
  business_partners.billing_address    AS partner_billing_address,
  business_partners.shipping_address   AS partner_shipping_address,
  business_partners.email              AS partner_email,
  business_partner_types.name          AS partner_type,
  shippings.name                       AS shipping,
  delivery_orders.sales_person_id     AS sales_person_id,
  employees.name                       AS sales_person_name,
  delivery_orders.created_at          AS created_at,
  delivery_orders.updated_at          AS updated_at
FROM
  delivery_orders
  INNER JOIN business_partners
    ON delivery_orders.business_partner_id = business_partners.id
  INNER JOIN business_partner_types
    ON business_partners.business_partner_type_id = business_partner_types.id
  INNER JOIN shippings
    ON business_partners.shipping_id = shippings.id
  INNER JOIN sales_people
    ON delivery_orders.sales_person_id = sales_people.id
  INNER JOIN employees
    ON sales_people.employee_id = employees.id;