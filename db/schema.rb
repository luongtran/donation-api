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

ActiveRecord::Schema.define(version: 20170408181740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address_fullname"
    t.integer  "flat_building_number"
    t.string   "address_line1"
    t.text     "address_instruction"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "api_v1_donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "charity_id"
    t.integer  "package_cost_id"
    t.integer  "address_id"
    t.float    "total_price"
    t.integer  "number_of_cartons"
    t.boolean  "is_fragile"
    t.integer  "wimo_task_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "attachmentable_type"
    t.integer  "attachmentable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["attachmentable_type", "attachmentable_id"], name: "index_attachments_on_attachmentable_type_and_attachmentable_id", using: :btree
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.integer  "charity_location_id"
    t.boolean  "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "charity_locations", force: :cascade do |t|
    t.string   "location_name"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courier_costs", force: :cascade do |t|
    t.float    "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "os"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "token"], name: "index_devices_on_user_id_and_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "donation_categories", force: :cascade do |t|
    t.string   "cat_name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donation_categories_donations", id: false, force: :cascade do |t|
    t.integer "donation_id",          null: false
    t.integer "donation_category_id", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "charity_id"
    t.integer  "package_cost_id"
    t.integer  "address_id"
    t.float    "total_price"
    t.integer  "number_of_cartons"
    t.boolean  "is_fragile"
    t.integer  "wimo_task_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "package_costs", force: :cascade do |t|
    t.string   "package_size"
    t.float    "cost_per_carton"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.json     "tokens"
    t.string   "role",                   default: "user",  null: false
    t.string   "fullname"
    t.string   "nickname"
    t.string   "company_name"
    t.string   "organisation"
    t.string   "website"
    t.string   "phone"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email", "provider"], name: "index_users_on_email_and_provider", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "devices", "users"
end
