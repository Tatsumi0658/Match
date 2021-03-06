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

ActiveRecord::Schema.define(version: 2019_05_18_060812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "relationships", force: :cascade do |t|
    t.integer "follow_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id", "followed_id"], name: "index_relationships_on_follow_id_and_followed_id", unique: true
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "sex", null: false
    t.integer "birth", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

end
