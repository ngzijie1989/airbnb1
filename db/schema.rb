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

ActiveRecord::Schema[7.1].define(version: 2024_04_02_043953) do
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

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "listing_id", null: false
    t.string "aproval_status"
    t.integer "no_of_guests"
    t.bigint "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lister_id"
    t.string "payment"
    t.integer "accom_fee"
    t.integer "total_fee"
    t.integer "cleaning_fee"
    t.integer "days_to_stay"
    t.integer "service_fee"
    t.boolean "apply_discount", default: false
    t.integer "points_used"
    t.integer "discounted_total"
    t.integer "discount"
    t.text "reject_reason"
    t.string "cancel_reason"
    t.index ["buyer_id"], name: "index_bookings_on_buyer_id"
    t.index ["lister_id"], name: "index_bookings_on_lister_id"
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_favorites_on_listing_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "country"
    t.integer "no_of_rooms"
    t.integer "price_per_night"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.integer "service_fee_per_night"
    t.integer "cleaning_fee_per_night"
    t.string "title"
    t.string "subtitle"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.text "description"
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "message"
    t.boolean "read", default: false
    t.boolean "soft_delete", default: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_header"
    t.string "notification_type"
    t.bigint "booking_id"
    t.bigint "listing_id"
    t.index ["booking_id"], name: "index_notifications_on_booking_id"
    t.index ["listing_id"], name: "index_notifications_on_listing_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "redemptions", force: :cascade do |t|
    t.integer "points_redeemed"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.integer "discount_applied"
    t.index ["booking_id"], name: "index_redemptions_on_booking_id"
    t.index ["user_id"], name: "index_redemptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "bio"
    t.string "name"
    t.integer "points", default: 0
    t.integer "accumulated_points", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users", column: "buyer_id"
  add_foreign_key "bookings", "users", column: "lister_id"
  add_foreign_key "favorites", "listings"
  add_foreign_key "favorites", "users"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "users"
  add_foreign_key "notifications", "bookings"
  add_foreign_key "notifications", "listings"
  add_foreign_key "notifications", "users"
  add_foreign_key "redemptions", "bookings"
  add_foreign_key "redemptions", "users"
end
