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

ActiveRecord::Schema.define(version: 20180324173811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "category_packages", force: :cascade do |t|
    t.integer "category_id"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "source_code_url"
    t.integer "total_downloads"
    t.integer "score"
    t.jsonb "json_data", default: "{}"
    t.jsonb "releases_json", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "github_readme"
    t.string "github_url"
    t.boolean "do_not_change_urls", default: false
    t.index ["name"], name: "index_packages_on_name"
  end

  create_table "releases", force: :cascade do |t|
    t.bigint "package_id"
    t.string "key"
    t.jsonb "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_downloads"
    t.boolean "has_sig"
    t.datetime "upload_time"
    t.string "python_version"
    t.integer "downloads"
    t.string "packagetype"
    t.integer "size"
    t.index ["package_id", "key", "packagetype"], name: "index_releases_on_package_id_and_key_and_packagetype"
    t.index ["package_id"], name: "index_releases_on_package_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
