# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_07_195106) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "book_requests", force: :cascade do |t|
    t.bigint "requester_id_id", null: false
    t.bigint "requested_book_id_id", null: false
    t.bigint "meeting_place_id_id"
    t.datetime "meeting_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state"
    t.index ["meeting_place_id_id"], name: "index_book_requests_on_meeting_place_id_id"
    t.index ["requested_book_id_id"], name: "index_book_requests_on_requested_book_id_id"
    t.index ["requester_id_id"], name: "index_book_requests_on_requester_id_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "discription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_book_picture_tag"
  end

  create_table "creating_meeting_place_requests", force: :cascade do |t|
    t.string "email"
    t.string "stor_name"
    t.string "owner_name"
    t.string "city_name"
    t.string "location_details"
    t.bigint "governate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["governate"], name: "index_creating_meeting_place_requests_on_governate"
  end

  create_table "meeting_places", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "store_name"
    t.string "owner_name"
    t.string "store_type"
    t.string "city_name"
    t.string "location_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "governate"
    t.index ["email"], name: "index_meeting_places_on_email", unique: true
    t.index ["governate"], name: "index_meeting_places_on_governate"
    t.index ["reset_password_token"], name: "index_meeting_places_on_reset_password_token", unique: true
  end

  create_table "request_logs", force: :cascade do |t|
    t.bigint "first_side_id", null: false
    t.bigint "second_side_id", null: false
    t.bigint "first_side_book_id", null: false
    t.bigint "second_side_book_id", null: false
    t.boolean "first_side_presence"
    t.boolean "second_side_presence"
    t.bigint "meeting_place_id", null: false
    t.datetime "meeting_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_side_book_id"], name: "index_request_logs_on_first_side_book_id"
    t.index ["first_side_id"], name: "index_request_logs_on_first_side_id"
    t.index ["meeting_place_id"], name: "index_request_logs_on_meeting_place_id"
    t.index ["second_side_book_id"], name: "index_request_logs_on_second_side_book_id"
    t.index ["second_side_id"], name: "index_request_logs_on_second_side_id"
  end

  create_table "supported_governates", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_have_books", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_rate"
    t.boolean "availbe_to_trade"
    t.index ["book_id"], name: "index_user_have_books_on_book_id"
    t.index ["user_id"], name: "index_user_have_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1
    t.bigint "location"
    t.date "birthdate"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location"], name: "index_users_on_location"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_requests", "meeting_places", column: "meeting_place_id_id"
  add_foreign_key "book_requests", "user_have_books", column: "requested_book_id_id"
  add_foreign_key "book_requests", "users", column: "requester_id_id"
  add_foreign_key "creating_meeting_place_requests", "supported_governates", column: "governate"
  add_foreign_key "meeting_places", "supported_governates", column: "governate"
  add_foreign_key "request_logs", "books", column: "first_side_book_id"
  add_foreign_key "request_logs", "books", column: "second_side_book_id"
  add_foreign_key "request_logs", "meeting_places"
  add_foreign_key "request_logs", "users", column: "first_side_id"
  add_foreign_key "request_logs", "users", column: "second_side_id"
  add_foreign_key "user_have_books", "books"
  add_foreign_key "user_have_books", "users"
  add_foreign_key "users", "supported_governates", column: "location"
end
