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

ActiveRecord::Schema[7.2].define(version: 2023_12_08_221807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "app_gems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "favoritable_type", null: false
    t.uuid "favoritable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gemfile_app_gems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "gemfile_id", null: false
    t.uuid "app_gem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_gem_id"], name: "index_gemfile_app_gems_on_app_gem_id"
    t.index ["gemfile_id"], name: "index_gemfile_app_gems_on_gemfile_id"
  end

  create_table "gemfiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "app_link"
    t.string "github_link"
    t.integer "gem_count"
    t.text "notes"
    t.index ["user_id"], name: "index_gemfiles_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_username"
    t.string "x_username"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "gemfile_app_gems", "app_gems"
  add_foreign_key "gemfile_app_gems", "gemfiles"
  add_foreign_key "gemfiles", "users"
end
