# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_02_160600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "worker_id"
    t.integer "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "placement_id"
    t.index ["placement_id"], name: "index_conversations_on_placement_id"
  end

  create_table "employments", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_employments_on_business_id"
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.boolean "confirmed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_placements_on_project_id"
    t.index ["user_id"], name: "index_placements_on_user_id"
  end

  create_table "project_qualifications", force: :cascade do |t|
    t.bigint "qualification_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_qualifications_on_project_id"
    t.index ["qualification_id"], name: "index_project_qualifications_on_qualification_id"
  end

  create_table "projects", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "wage"
    t.integer "capacity"
    t.text "description"
    t.string "job_type"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "autoconfirm", default: false
    t.index ["site_id"], name: "index_projects_on_site_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "worker_id"
    t.integer "manager_id"
    t.bigint "placement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stars"
    t.index ["placement_id"], name: "index_ratings_on_placement_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "site_type"
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "location"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_sites_on_company_id"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "user_qualifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "qualification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["qualification_id"], name: "index_user_qualifications_on_qualification_id"
    t.index ["user_id"], name: "index_user_qualifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.boolean "manager"
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "businesses", "users"
  add_foreign_key "conversations", "placements"
  add_foreign_key "employments", "businesses"
  add_foreign_key "employments", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "placements", "projects"
  add_foreign_key "placements", "users"
  add_foreign_key "project_qualifications", "projects"
  add_foreign_key "project_qualifications", "qualifications"
  add_foreign_key "projects", "sites"
  add_foreign_key "ratings", "placements"
  add_foreign_key "sites", "companies"
  add_foreign_key "sites", "users"
  add_foreign_key "user_qualifications", "qualifications"
  add_foreign_key "user_qualifications", "users"
end
