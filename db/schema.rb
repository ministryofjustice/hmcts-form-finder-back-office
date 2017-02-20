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

ActiveRecord::Schema.define(version: 20170215161919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "english_name"
    t.string   "welsh_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "inactive",     default: false
  end

  create_table "doc_attachment_types", force: :cascade do |t|
    t.string   "english_name"
    t.string   "welsh_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "document_categories", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "category_id"
    t.integer  "sort_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "document_categories", ["category_id"], name: "index_document_categories_on_category_id", using: :btree
  add_index "document_categories", ["document_id"], name: "index_document_categories_on_document_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.string   "category"
    t.integer  "doc_attachment_type_id",                  null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.date     "published_date"
    t.integer  "language_id"
    t.integer  "original_id"
    t.integer  "creator_id"
    t.boolean  "inactive",                default: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "english_name"
    t.string   "welsh_name"
    t.string   "code",                         null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "inactive",     default: false
  end

  create_table "related_documents", force: :cascade do |t|
    t.integer "document_id"
    t.integer "linked_document_id"
  end

  add_index "related_documents", ["document_id", "linked_document_id"], name: "index_related_documents_on_document_id_and_linked_document_id", unique: true, using: :btree
  add_index "related_documents", ["linked_document_id", "document_id"], name: "index_related_documents_on_linked_document_id_and_document_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "inactive",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "document_categories", "categories"
  add_foreign_key "document_categories", "documents"
end
