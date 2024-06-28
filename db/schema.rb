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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_203149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartment_requests", force: :cascade do |t|
    t.bigint "apartment_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_requests_on_apartment_id"
    t.index ["user_id"], name: "index_apartment_requests_on_user_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "street_address", null: false
    t.integer "bedrooms"
    t.decimal "rent"
    t.text "notes"
    t.bigint "neighborhood_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_apartments_on_city_id"
    t.index ["neighborhood_id"], name: "index_apartments_on_neighborhood_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.integer "cleanliness"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "apartment_id"
    t.index ["apartment_id"], name: "index_users_on_apartment_id"
  end

  add_foreign_key "apartment_requests", "apartments"
  add_foreign_key "apartment_requests", "users"
  add_foreign_key "apartments", "cities"
  add_foreign_key "apartments", "neighborhoods"
  add_foreign_key "neighborhoods", "cities"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "apartments"
end
