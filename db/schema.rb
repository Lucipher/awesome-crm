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

ActiveRecord::Schema.define(:version => 20120918155843) do

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

  create_table "ar_down_payment_invoice_items", :force => true do |t|
    t.integer  "ar_down_payment_invoice_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                                  :precision => 38, :scale => 0
    t.string   "line_status",                :limit => 20
    t.integer  "item_id",                                   :precision => 38, :scale => 0
    t.decimal  "quantity",                                  :precision => 19, :scale => 6
    t.decimal  "price",                                     :precision => 19, :scale => 6
    t.string   "currency",                   :limit => 3
    t.decimal  "rate",                                      :precision => 19, :scale => 6
    t.decimal  "line_total",                                :precision => 19, :scale => 6
    t.decimal  "disc_rate",                                 :precision => 19, :scale => 6
    t.decimal  "disc_total",                                :precision => 19, :scale => 6
    t.decimal  "tax_rate",                                  :precision => 19, :scale => 6
    t.decimal  "tax_total",                                 :precision => 19, :scale => 6
    t.decimal  "grand_total",                               :precision => 19, :scale => 6
    t.string   "remarks",                    :limit => 100
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
  end

  create_table "ar_down_payment_invoices", :force => true do |t|
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

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "phone"
    t.string   "email"
    t.datetime "start_date"
    t.string   "status"
    t.datetime "terminate_date"
    t.text     "remarks"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "goods_received_items", :force => true do |t|
    t.integer  "goods_received_id",                  :precision => 38, :scale => 0
    t.integer  "item_id",                            :precision => 38, :scale => 0
    t.decimal  "quantity",                           :precision => 19, :scale => 6
    t.decimal  "price",                              :precision => 19, :scale => 6
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "line_total",                         :precision => 19, :scale => 6
    t.decimal  "total_foreign",                      :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "tax_total_foreign",                  :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total_foreign",                :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
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
    t.integer  "goods_returned_id",                  :precision => 38, :scale => 0
    t.integer  "item_id",                            :precision => 38, :scale => 0
    t.decimal  "quantity",                           :precision => 19, :scale => 6
    t.decimal  "price",                              :precision => 19, :scale => 6
    t.string   "currency",            :limit => 3
    t.decimal  "rate",                               :precision => 19, :scale => 6
    t.decimal  "line_total",                         :precision => 19, :scale => 6
    t.decimal  "total_foreign",                      :precision => 19, :scale => 6
    t.decimal  "tax_rate",                           :precision => 19, :scale => 6
    t.decimal  "tax_total",                          :precision => 19, :scale => 6
    t.decimal  "tax_total_foreign",                  :precision => 19, :scale => 6
    t.decimal  "grand_total",                        :precision => 19, :scale => 6
    t.decimal  "grand_total_foreign",                :precision => 19, :scale => 6
    t.string   "remarks",             :limit => 100
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
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
    t.string   "name"
    t.string   "status"
    t.string   "type"
    t.string   "unit"
    t.integer  "weight",                 :precision => 38, :scale => 0
    t.integer  "length",                 :precision => 38, :scale => 0
    t.integer  "width",                  :precision => 38, :scale => 0
    t.integer  "height",                 :precision => 38, :scale => 0
    t.integer  "group_id",               :precision => 38, :scale => 0
    t.integer  "on_hand",                :precision => 38, :scale => 0
    t.integer  "committed",              :precision => 38, :scale => 0
    t.integer  "on_order",               :precision => 38, :scale => 0
    t.integer  "max_quantity",           :precision => 38, :scale => 0
    t.integer  "reorder_quantity",       :precision => 38, :scale => 0
    t.integer  "last_purchase_price",    :precision => 38, :scale => 0
    t.string   "last_purchase_currency"
    t.datetime "last_purchase_date"
    t.integer  "last_sales_price",       :precision => 38, :scale => 0
    t.string   "last_sales_currency"
    t.datetime "last_sales_date"
    t.integer  "average_price",          :precision => 38, :scale => 0
    t.integer  "stock_value",            :precision => 38, :scale => 0
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
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
    t.integer  "line_num",                  :precision => 38, :scale => 0
    t.string   "line_status", :limit => 20
    t.datetime "open_date"
    t.datetime "pred_date"
    t.datetime "close_date"
    t.string   "status",      :limit => 15
    t.text     "memo"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  create_table "sales_order_items", :force => true do |t|
    t.integer  "line_num",                   :precision => 38, :scale => 0
    t.string   "line_status", :limit => 20
    t.integer  "item_id",                    :precision => 38, :scale => 0
    t.decimal  "quantity",                   :precision => 19, :scale => 6
    t.decimal  "price",                      :precision => 19, :scale => 6
    t.string   "currency",    :limit => 3
    t.decimal  "rate",                       :precision => 19, :scale => 6
    t.decimal  "line_total",                 :precision => 19, :scale => 6
    t.decimal  "disc_rate",                  :precision => 19, :scale => 6
    t.decimal  "disc_total",                 :precision => 19, :scale => 6
    t.decimal  "tax_rate",                   :precision => 19, :scale => 6
    t.decimal  "tax_total",                  :precision => 19, :scale => 6
    t.decimal  "grand_total",                :precision => 19, :scale => 6
    t.string   "remarks",     :limit => 100
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
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
    t.string   "name"
    t.text     "memo"
    t.integer  "commission",  :precision => 38, :scale => 0
    t.boolean  "locked",      :precision => 1,  :scale => 0
    t.integer  "team_id",     :precision => 38, :scale => 0
    t.integer  "employee_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "sales_quotation_items", :force => true do |t|
    t.integer  "sales_quotation_id",                :precision => 38, :scale => 0
    t.integer  "line_num",                          :precision => 38, :scale => 0
    t.string   "line_status",        :limit => 20
    t.integer  "item_id",                           :precision => 38, :scale => 0
    t.integer  "quantity",                          :precision => 38, :scale => 0
    t.integer  "price",                             :precision => 38, :scale => 0
    t.string   "currency",           :limit => 3
    t.integer  "rate",                              :precision => 38, :scale => 0
    t.integer  "line_total",                        :precision => 38, :scale => 0
    t.integer  "disc_rate",                         :precision => 38, :scale => 0
    t.integer  "disc_total",                        :precision => 38, :scale => 0
    t.integer  "tax_rate",                          :precision => 38, :scale => 0
    t.integer  "tax_total",                         :precision => 38, :scale => 0
    t.integer  "grand_total",                       :precision => 38, :scale => 0
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
    t.integer  "rate",                               :precision => 38, :scale => 0
    t.integer  "total",                              :precision => 38, :scale => 0
    t.integer  "disc_rate",                          :precision => 38, :scale => 0
    t.integer  "disc_total",                         :precision => 38, :scale => 0
    t.integer  "tax_rate",                           :precision => 38, :scale => 0
    t.integer  "tax_total",                          :precision => 38, :scale => 0
    t.integer  "grand_total",                        :precision => 38, :scale => 0
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
    t.string   "encrypted_password",    :limit => 1024, :default => "", :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "username"
    t.string   "password_salt",         :limit => 1024
    t.string   "db_encrypted_password", :limit => 1024
    t.string   "db_username"
    t.string   "auth_token"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
