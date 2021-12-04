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

ActiveRecord::Schema.define(version: 2021_12_03_215021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ct_data", force: :cascade do |t|
    t.bigint "site_id"
    t.integer "ct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_ct_data_on_site_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "site_advisors", force: :cascade do |t|
    t.bigint "advised_site_id"
    t.bigint "advisor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["advised_site_id"], name: "index_site_advisors_on_advised_site_id"
    t.index ["advisor_id"], name: "index_site_advisors_on_advisor_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.integer "site_type"
    t.bigint "breeder_id"
    t.string "location"
    t.string "city"
    t.string "post_code"
    t.integer "longitude"
    t.integer "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breeder_id"], name: "index_sites_on_breeder_id"
  end

  create_table "thi_data", force: :cascade do |t|
    t.bigint "site_id"
    t.integer "thi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_thi_data_on_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_advisor?", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "site_advisors", "sites", column: "advised_site_id"
  add_foreign_key "site_advisors", "users", column: "advisor_id"
  add_foreign_key "sites", "users", column: "breeder_id"
end
