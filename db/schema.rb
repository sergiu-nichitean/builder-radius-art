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

ActiveRecord::Schema[7.0].define(version: 2024_09_18_032035) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
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

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "click_events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "click_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_click_events_on_user_id"
  end

  create_table "collections", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "song_id"
    t.string "name"
    t.text "description"
    t.string "max_supply"
    t.boolean "open_edition"
    t.string "treasury_wallet"
    t.integer "remote_id"
    t.boolean "free_mint"
    t.float "price_sol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_supply", default: 0
    t.string "flight_number"
    t.string "origin"
    t.string "destination"
    t.string "departure_date"
    t.string "departure_time"
    t.string "arrival_date"
    t.string "arrival_time"
    t.string "royalties_percent"
    t.string "royalties_wallet"
    t.text "collection_description"
    t.string "type"
    t.string "collection_name"
    t.string "latitude"
    t.string "longitude"
    t.index ["song_id"], name: "index_collections_on_song_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "external_id"
    t.bigint "user_id", null: false
    t.text "status", null: false
    t.text "stripe_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "company_name"
    t.string "vat_id"
    t.float "amount"
    t.integer "credits"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "sites", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "remote_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "front_page_id"
    t.integer "about_page_id"
    t.integer "contact_page_id"
    t.string "title"
    t.integer "logo_remote_id"
    t.string "subdomain"
    t.string "twitter"
    t.string "discord"
    t.string "instagram"
    t.integer "icon_remote_id"
    t.string "logo_remote_url"
    t.string "icon_remote_url"
    t.integer "nft_image_remote_id"
    t.string "nft_image_remote_url"
    t.integer "nft_animation_remote_id"
    t.string "nft_animation_remote_url"
    t.string "nft_name"
    t.string "nft_description"
    t.string "max_supply"
    t.boolean "open_edition"
    t.string "symbol"
    t.string "external_url"
    t.string "treasury_wallet"
    t.string "mint_button_text"
    t.integer "collection_remote_id"
    t.string "mint_page_title"
    t.text "mint_page_content"
    t.integer "banner_remote_id"
    t.string "banner_remote_url"
    t.boolean "free_mint"
    t.float "price_sol"
    t.boolean "about_page_enable"
    t.string "about_page_title"
    t.text "about_page_content"
    t.boolean "contact_page_enable"
    t.string "contact_email"
    t.text "contact_page_content"
    t.boolean "tokengating_enable"
    t.string "tokengating_title"
    t.text "tokengating_content"
    t.integer "preview_version"
    t.integer "status", default: 0
    t.text "error"
    t.boolean "email_claim"
    t.string "latitude"
    t.string "longitude"
    t.string "start_time"
    t.string "start_date"
    t.string "end_time"
    t.string "end_date"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "songs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "keywords"
    t.text "description"
    t.string "music_url"
    t.string "cover_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "lyrics"
    t.integer "status", default: 0
    t.text "error"
    t.text "error_details", size: :medium
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "plan"
    t.string "ip_address"
    t.string "user_agent"
    t.integer "credits", default: 0, null: false
    t.text "stripe_customer_id"
    t.string "wallet_address"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["wallet_address"], name: "index_users_on_wallet_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "click_events", "users"
  add_foreign_key "collections", "songs"
  add_foreign_key "collections", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "sites", "users"
  add_foreign_key "songs", "users"
end
