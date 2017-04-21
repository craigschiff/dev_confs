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

ActiveRecord::Schema.define(version: 20170417183053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_accounts_on_username", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.string   "website"
    t.text     "address"
    t.text     "perks"
    t.string   "cost"
    t.integer  "organizer_id"
    t.integer  "city_id"
    t.integer  "topic_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["city_id"], name: "index_events_on_city_id", using: :btree
    t.index ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
    t.index ["topic_id"], name: "index_events_on_topic_id", using: :btree
  end

  create_table "organizer_topics", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "organizer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["organizer_id"], name: "index_organizer_topics_on_organizer_id", using: :btree
    t.index ["topic_id"], name: "index_organizer_topics_on_topic_id", using: :btree
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.text     "skills"
    t.string   "portfolio"
    t.integer  "city_id"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_profiles_on_account_id", using: :btree
    t.index ["city_id"], name: "index_profiles_on_city_id", using: :btree
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id", using: :btree
    t.index ["profile_id"], name: "index_rsvps_on_profile_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "cities"
  add_foreign_key "events", "organizers"
  add_foreign_key "events", "topics"
  add_foreign_key "organizer_topics", "organizers"
  add_foreign_key "organizer_topics", "topics"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "profiles", "cities"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "profiles"
end
