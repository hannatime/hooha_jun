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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150117230010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_name"
    t.string   "account_website"
    t.string   "account_phone"
    t.string   "account_address"
    t.string   "account_postcode"
    t.string   "account_city"
    t.string   "account_state"
    t.string   "account_country"
    t.integer  "user_id"
  end

  create_table "customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_email"
    t.string   "customer_phone"
    t.string   "customer_address"
    t.string   "customer_city"
    t.string   "customer_state"
    t.string   "customer_country"
    t.string   "customer_postcode"
    t.integer  "user_id"
    t.integer  "account_id"
  end

  create_table "customers_opportunities", id: false, force: true do |t|
    t.integer "customer_id"
    t.integer "opportunity_id"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "leads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lead_interested_in"
    t.string   "lead_comments"
    t.string   "lead_status"
    t.string   "lead_source"
    t.string   "lead_owner"
    t.string   "lead_account_name"
    t.string   "lead_opportunity_name"
    t.string   "lead_opportunity_owner"
    t.integer  "user_id"
  end

  create_table "opportunities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "opportunity_name"
    t.decimal  "opportunity_amount"
    t.string   "opportunity_stage"
    t.string   "opportunity_probability"
    t.string   "opportunity_comments"
    t.date     "opportunity_closing_date"
    t.integer  "user_id"
    t.integer  "account_id"
    t.boolean  "omitted",                  default: false
  end

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_name"
    t.string   "product_type"
    t.string   "product_status"
    t.string   "product_sell"
    t.string   "product_cost"
    t.string   "product_comments"
    t.integer  "user_id"
  end

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_name"
    t.date     "project_due_date"
    t.string   "project_comments"
    t.integer  "account_id"
    t.integer  "user_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "task_name"
    t.date     "task_due_date"
    t.string   "task_type"
    t.string   "task_comments"
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.string   "task_status"
    t.string   "task_active"
    t.integer  "project_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_id"
    t.string   "last_4_digits"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
