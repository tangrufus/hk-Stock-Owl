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

ActiveRecord::Schema.define(version: 20141105200615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.text     "namespace"
    t.text     "body"
    t.text     "resource_id",   null: false
    t.text     "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ex_documents", force: true do |t|
    t.text     "title",            default: "",                        null: false
    t.text     "link",             default: "http://www.hkexnews.hk/", null: false
    t.text     "short_link",       default: ""
    t.integer  "stock_company_id"
    t.datetime "released_at",                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ex_documents", ["stock_company_id"], name: "index_ex_documents_on_stock_company_id", using: :btree

  create_table "ex_taggings", force: true do |t|
    t.integer  "ex_document_id"
    t.integer  "ex_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ex_taggings", ["ex_document_id"], name: "index_ex_taggings_on_ex_document_id", using: :btree
  add_index "ex_taggings", ["ex_tag_id"], name: "index_ex_taggings_on_ex_tag_id", using: :btree

  create_table "ex_tags", force: true do |t|
    t.text     "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ex_tags", ["name"], name: "index_ex_tags_on_name", unique: true, using: :btree

  create_table "stock_companies", force: true do |t|
    t.text     "name",       default: "", null: false
    t.integer  "code",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_companies", ["code"], name: "index_stock_companies_on_code", unique: true, using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "subscriptable_id",   null: false
    t.string   "subscriptable_type", null: false
    t.integer  "subscribed_id",      null: false
    t.string   "subscribed_type",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["subscribed_type", "subscribed_id"], name: "index_subscriptions_on_subscribed_type_and_subscribed_id", using: :btree
  add_index "subscriptions", ["subscriptable_id", "subscriptable_type", "subscribed_id", "subscribed_type"], name: "index_unique_subscriptions", unique: true, using: :btree
  add_index "subscriptions", ["subscriptable_type", "subscriptable_id"], name: "index_subscriptions_on_subscriptable_type_and_subscriptable_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.text     "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text     "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.text     "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
