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

ActiveRecord::Schema.define(version: 20171102144733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hobbies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reading"
    t.string "gym"
    t.string "movie"
    t.string "dancing"
    t.string "outside"
    t.string "food"
    t.string "drinks"
    t.string "museums"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hobbies_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "receiver_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "primary_lang_id"
    t.bigint "secondary_lang_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.string "fullname"
    t.string "username"
    t.string "password"
    t.integer "age"
    t.string "gender"
    t.string "country"
    t.string "us_state"
    t.text "bio"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "neighborhood_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["neighborhood_id"], name: "index_users_on_neighborhood_id"
    t.index ["primary_lang_id"], name: "index_users_on_primary_lang_id"
    t.index ["receiver_id"], name: "index_users_on_receiver_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["secondary_lang_id"], name: "index_users_on_secondary_lang_id"
    t.index ["sender_id"], name: "index_users_on_sender_id"
  end

  add_foreign_key "hobbies", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "users", "neighborhoods"
end
