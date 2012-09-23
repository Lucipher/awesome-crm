# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120923011229) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",                                  :null => false
    t.string   "resource_type",                                :null => false
    t.integer  "author_id",     :precision => 38, :scale => 0
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "i_act_adm_com_aut_typ_aut_id"
  add_index "active_admin_comments", ["namespace"], :name => "i_act_adm_com_nam"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "i_adm_not_res_typ_res_id"

  create_table "ar_credit_memo_items", :force => true do |t|
    t.integer  "ar_credit_memo_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                         :precision => 38, :scale => 0
    t.string   "line_status",       :limit => 20
    t.integer  "item_id",                          :precision => 38, :scale => 0
    t.decimal  "quantity",                         :precision => 19, :scale => 6
    t.decimal  "price",                            :precision => 19, :scale => 6
    t.string   "currency",          :limit => 3
    t.decimal  "rate",                             :precision => 19, :scale => 6
    t.decimal  "line_total",                       :precision => 19, :scale => 6
    t.decimal  "disc_rate",                        :precision => 19, :scale => 6
    t.decimal  "disc_total",                       :precision => 19, :scale => 6
    t.decimal  "tax_rate",                         :precision => 19, :scale => 6
    t.decimal  "tax_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total",                      :precision => 19, :scale => 6
    t.string   "remarks",           :limit => 100
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.integer  "ref_id",                           :precision => 38, :scale => 0
  end

  create_table "ar_credit_memos", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "ar_dp_invoice_items", :force => true do |t|
    t.integer  "ar_dp_invoice_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                        :precision => 38, :scale => 0
    t.string   "line_status",      :limit => 20
    t.integer  "item_id",                         :precision => 38, :scale => 0
    t.decimal  "quantity",                        :precision => 19, :scale => 6
    t.decimal  "price",                           :precision => 19, :scale => 6
    t.string   "currency",         :limit => 3
    t.decimal  "rate",                            :precision => 19, :scale => 6
    t.decimal  "line_total",                      :precision => 19, :scale => 6
    t.decimal  "disc_rate",                       :precision => 19, :scale => 6
    t.decimal  "disc_total",                      :precision => 19, :scale => 6
    t.decimal  "tax_rate",                        :precision => 19, :scale => 6
    t.decimal  "tax_total",                       :precision => 19, :scale => 6
    t.decimal  "grand_total",                     :precision => 19, :scale => 6
    t.string   "remarks",          :limit => 100
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.integer  "ref_id",                          :precision => 38, :scale => 0
  end

  create_table "ar_dp_invoices", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "ar_invoice_items", :force => true do |t|
    t.integer  "ar_invoice_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                     :precision => 38, :scale => 0
    t.string   "line_status",   :limit => 20
    t.integer  "item_id",                      :precision => 38, :scale => 0
    t.decimal  "quantity",                     :precision => 19, :scale => 6
    t.decimal  "price",                        :precision => 19, :scale => 6
    t.string   "currency",      :limit => 3
    t.decimal  "rate",                         :precision => 19, :scale => 6
    t.decimal  "line_total",                   :precision => 19, :scale => 6
    t.decimal  "disc_rate",                    :precision => 19, :scale => 6
    t.decimal  "disc_total",                   :precision => 19, :scale => 6
    t.decimal  "tax_rate",                     :precision => 19, :scale => 6
    t.decimal  "tax_total",                    :precision => 19, :scale => 6
    t.decimal  "grand_total",                  :precision => 19, :scale => 6
    t.string   "remarks",       :limit => 100
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "ref_id",                       :precision => 38, :scale => 0
  end

  create_table "ar_invoices", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "assignments", :force => true do |t|
    t.integer  "business_partner_id", :precision => 38, :scale => 0
    t.integer  "sales_person_id",     :precision => 38, :scale => 0
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "business_partner_types", :force => true do |t|
    t.string   "name"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_partners", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "billing_address"
    t.text     "shipping_address"
    t.string   "email"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "business_partner_type_id", :precision => 38, :scale => 0
    t.integer  "shipping_id",              :precision => 38, :scale => 0
    t.decimal  "credit_limit",             :precision => 19, :scale => 6
    t.decimal  "credit_balance",           :precision => 19, :scale => 6
  end

  create_table "delivery_order_items", :force => true do |t|
    t.integer  "delivery_order_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                         :precision => 38, :scale => 0
    t.string   "line_status",       :limit => 20
    t.integer  "item_id",                          :precision => 38, :scale => 0
    t.decimal  "quantity",                         :precision => 19, :scale => 6
    t.decimal  "price",                            :precision => 19, :scale => 6
    t.string   "currency",          :limit => 3
    t.decimal  "rate",                             :precision => 19, :scale => 6
    t.decimal  "line_total",                       :precision => 19, :scale => 6
    t.decimal  "disc_rate",                        :precision => 19, :scale => 6
    t.decimal  "disc_total",                       :precision => 19, :scale => 6
    t.decimal  "tax_rate",                         :precision => 19, :scale => 6
    t.decimal  "tax_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total",                      :precision => 19, :scale => 6
    t.string   "remarks",           :limit => 100
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.integer  "ref_id",                           :precision => 38, :scale => 0
  end

  create_table "delivery_orders", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name",       :limit => 20
    t.string   "remarks",    :limit => 100
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "phone"
    t.string   "email"
    t.datetime "start_date"
    t.string   "status"
    t.datetime "terminate_date"
    t.text     "remarks"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "department_id",  :precision => 38, :scale => 0
    t.integer  "job_title_id",   :precision => 38, :scale => 0
  end

  create_table "goods_received_items", :force => true do |t|
    t.integer  "goods_received_id",                :precision => 38, :scale => 0
    t.integer  "item_id",                          :precision => 38, :scale => 0
    t.decimal  "quantity",                         :precision => 19, :scale => 6
    t.decimal  "price",                            :precision => 19, :scale => 6
    t.string   "currency",          :limit => 3
    t.decimal  "rate",                             :precision => 19, :scale => 6
    t.decimal  "line_total",                       :precision => 19, :scale => 6
    t.decimal  "tax_rate",                         :precision => 19, :scale => 6
    t.decimal  "tax_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total",                      :precision => 19, :scale => 6
    t.string   "remarks",           :limit => 100
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  create_table "goods_receiveds", :force => true do |t|
    t.string   "doc_type",     :limit => 20
    t.string   "doc_status",   :limit => 20
    t.datetime "doc_date"
    t.datetime "doc_due_date"
    t.string   "doc_currency", :limit => 3
    t.decimal  "doc_rate",                    :precision => 19, :scale => 6
    t.decimal  "doc_total",                   :precision => 19, :scale => 6
    t.decimal  "doc_total_fc",                :precision => 19, :scale => 6
    t.string   "remarks",      :limit => 100
    t.integer  "employee_id",                 :precision => 38, :scale => 0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "goods_returned_items", :force => true do |t|
    t.integer  "goods_returned_id",                :precision => 38, :scale => 0
    t.integer  "item_id",                          :precision => 38, :scale => 0
    t.decimal  "quantity",                         :precision => 19, :scale => 6
    t.decimal  "price",                            :precision => 19, :scale => 6
    t.string   "currency",          :limit => 3
    t.decimal  "rate",                             :precision => 19, :scale => 6
    t.decimal  "line_total",                       :precision => 19, :scale => 6
    t.decimal  "tax_rate",                         :precision => 19, :scale => 6
    t.decimal  "tax_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total",                      :precision => 19, :scale => 6
    t.string   "remarks",           :limit => 100
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  create_table "goods_returneds", :force => true do |t|
    t.string   "doc_type",     :limit => 20
    t.string   "doc_status",   :limit => 20
    t.datetime "doc_date"
    t.datetime "doc_due_date"
    t.string   "doc_currency", :limit => 3
    t.decimal  "doc_rate",                    :precision => 19, :scale => 6
    t.decimal  "doc_total",                   :precision => 19, :scale => 6
    t.decimal  "doc_total_fc",                :precision => 19, :scale => 6
    t.string   "remarks",      :limit => 100
    t.integer  "employee_id",                 :precision => 38, :scale => 0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name",                   :limit => 100
    t.string   "status",                 :limit => 20
    t.string   "type",                   :limit => 20
    t.string   "unit",                   :limit => 20
    t.decimal  "weight",                                :precision => 19, :scale => 6
    t.decimal  "length",                                :precision => 19, :scale => 6
    t.decimal  "width",                                 :precision => 19, :scale => 6
    t.decimal  "height",                                :precision => 19, :scale => 6
    t.integer  "group_id",                              :precision => 38, :scale => 0
    t.decimal  "on_hand",                               :precision => 19, :scale => 6, :default => 0.0
    t.decimal  "committed",                             :precision => 19, :scale => 6, :default => 0.0
    t.decimal  "on_order",                              :precision => 19, :scale => 6, :default => 0.0
    t.decimal  "max_quantity",                          :precision => 19, :scale => 6
    t.decimal  "reorder_quantity",                      :precision => 19, :scale => 6
    t.decimal  "last_purchase_price",                   :precision => 19, :scale => 6
    t.string   "last_purchase_currency", :limit => 3
    t.datetime "last_purchase_date"
    t.decimal  "last_sales_price",                      :precision => 19, :scale => 6
    t.string   "last_sales_currency",    :limit => 3
    t.datetime "last_sales_date"
    t.decimal  "average_price",                         :precision => 19, :scale => 6
    t.decimal  "stock_value",                           :precision => 19, :scale => 6, :default => 0.0
    t.datetime "created_at",                                                                            :null => false
    t.datetime "updated_at",                                                                            :null => false
  end

  create_table "job_titles", :force => true do |t|
    t.string   "name",       :limit => 20
    t.string   "remarks",    :limit => 100
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "sales_opportunities", :force => true do |t|
    t.datetime "doc_date"
    t.datetime "open_date"
    t.datetime "pred_date"
    t.datetime "close_date"
    t.string   "status",              :limit => 15
    t.text     "memo"
    t.integer  "business_partner_id",               :precision => 38, :scale => 0
    t.integer  "sales_person_id",                   :precision => 38, :scale => 0
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  create_table "sales_opportunity_items", :force => true do |t|
    t.integer  "line_num",                           :precision => 38, :scale => 0
    t.string   "line_status",          :limit => 20
    t.datetime "open_date"
    t.datetime "pred_date"
    t.datetime "close_date"
    t.string   "status",               :limit => 15
    t.text     "memo"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "sales_opportunity_id",               :precision => 38, :scale => 0
  end

  create_table "sales_order_items", :force => true do |t|
    t.integer  "line_num",                      :precision => 38, :scale => 0
    t.string   "line_status",    :limit => 20
    t.integer  "item_id",                       :precision => 38, :scale => 0
    t.decimal  "quantity",                      :precision => 19, :scale => 6
    t.decimal  "price",                         :precision => 19, :scale => 6
    t.string   "currency",       :limit => 3
    t.decimal  "rate",                          :precision => 19, :scale => 6
    t.decimal  "line_total",                    :precision => 19, :scale => 6
    t.decimal  "disc_rate",                     :precision => 19, :scale => 6
    t.decimal  "disc_total",                    :precision => 19, :scale => 6
    t.decimal  "tax_rate",                      :precision => 19, :scale => 6
    t.decimal  "tax_total",                     :precision => 19, :scale => 6
    t.decimal  "grand_total",                   :precision => 19, :scale => 6
    t.string   "remarks",        :limit => 100
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "sales_order_id",                :precision => 38, :scale => 0
    t.integer  "ref_id",                        :precision => 38, :scale => 0
  end

  create_table "sales_orders", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "sales_people", :force => true do |t|
    t.text     "memo"
    t.decimal  "commission",     :precision => 19, :scale => 6
    t.boolean  "locked",         :precision => 1,  :scale => 0
    t.integer  "team_id",        :precision => 38, :scale => 0
    t.integer  "employee_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.decimal  "credit_limit",   :precision => 19, :scale => 6
    t.decimal  "credit_balance", :precision => 19, :scale => 6
  end

  create_table "sales_quotation_items", :force => true do |t|
    t.integer  "sales_quotation_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                          :precision => 38, :scale => 0
    t.string   "line_status",        :limit => 20
    t.integer  "item_id",                           :precision => 38, :scale => 0
    t.decimal  "quantity",                          :precision => 19, :scale => 6
    t.decimal  "price",                             :precision => 19, :scale => 6
    t.string   "currency",           :limit => 3
    t.decimal  "rate",                              :precision => 19, :scale => 6
    t.decimal  "line_total",                        :precision => 19, :scale => 6
    t.decimal  "disc_rate",                         :precision => 19, :scale => 6
    t.decimal  "disc_total",                        :precision => 19, :scale => 6
    t.decimal  "tax_rate",                          :precision => 19, :scale => 6
    t.decimal  "tax_total",                         :precision => 19, :scale => 6
    t.decimal  "grand_total",                       :precision => 19, :scale => 6
    t.string   "remarks",            :limit => 100
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  create_table "sales_quotations", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "sales_return_items", :force => true do |t|
    t.integer  "sales_return_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                       :precision => 38, :scale => 0
    t.string   "line_status",     :limit => 20
    t.integer  "item_id",                        :precision => 38, :scale => 0
    t.decimal  "quantity",                       :precision => 19, :scale => 6
    t.decimal  "price",                          :precision => 19, :scale => 6
    t.string   "currency",        :limit => 3
    t.decimal  "rate",                           :precision => 19, :scale => 6
    t.decimal  "line_total",                     :precision => 19, :scale => 6
    t.decimal  "disc_rate",                      :precision => 19, :scale => 6
    t.decimal  "disc_total",                     :precision => 19, :scale => 6
    t.decimal  "tax_rate",                       :precision => 19, :scale => 6
    t.decimal  "tax_total",                      :precision => 19, :scale => 6
    t.decimal  "grand_total",                    :precision => 19, :scale => 6
    t.string   "remarks",         :limit => 100
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "ref_id",                         :precision => 38, :scale => 0
  end

  create_table "sales_returns", :force => true do |t|
    t.string   "type",                :limit => 20
    t.string   "status",              :limit => 20
    t.datetime "date"
    t.datetime "due_date"
    t.datetime "shipping_date"
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "total",                              :precision => 19, :scale => 6
    t.decimal  "disc_rate",                          :precision => 19, :scale => 6
    t.decimal  "disc_total",                         :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.integer  "business_partner_id",                :precision => 38, :scale => 0
    t.integer  "sales_person_id",                    :precision => 38, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "cookie_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "db_encrypted_password", :limit => 1024
  end

  create_table "shippings", :force => true do |t|
    t.string   "name"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "encrypted_password",    :limit => 1024,                                :default => "", :null => false
    t.datetime "created_at",                                                                           :null => false
    t.datetime "updated_at",                                                                           :null => false
    t.string   "username"
    t.string   "password_salt",         :limit => 1024
    t.string   "db_encrypted_password", :limit => 1024
    t.string   "db_username"
    t.string   "auth_token"
    t.integer  "employee_id",                           :precision => 38, :scale => 0
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
