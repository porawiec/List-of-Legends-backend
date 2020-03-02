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

ActiveRecord::Schema.define(version: 2020_03_02_135238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champs", force: :cascade do |t|
    t.string "name"
    t.string "icon_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "skins", force: :cascade do |t|
    t.string "name"
    t.string "splash_img"
    t.string "loading_img"
    t.bigint "champ_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champ_id"], name: "index_skins_on_champ_id"
  end

  create_table "user_champs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "champ_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champ_id"], name: "index_user_champs_on_champ_id"
    t.index ["user_id"], name: "index_user_champs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skin_id"], name: "index_wishes_on_skin_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "skins", "champs"
  add_foreign_key "user_champs", "champs"
  add_foreign_key "user_champs", "users"
  add_foreign_key "wishes", "skins"
  add_foreign_key "wishes", "users"
end
