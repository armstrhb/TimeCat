# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150830015929) do

  create_table "eras", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "abbreviation", null: false
    t.string   "description"
    t.integer  "length",       null: false
    t.integer  "universe_id",  null: false
    t.integer  "sequence",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "event_locations", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "location_id"
  end

  add_index "event_locations", ["event_id"], name: "index_event_locations_on_event_id"
  add_index "event_locations", ["location_id"], name: "index_event_locations_on_location_id"

  create_table "event_people", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "person_id"
  end

  add_index "event_people", ["event_id"], name: "index_event_people_on_event_id"
  add_index "event_people", ["person_id"], name: "index_event_people_on_person_id"

  create_table "events", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "description"
    t.integer  "time_instant_id", null: false
    t.integer  "part_of_id"
    t.integer  "universe_id",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "universe_id", null: false
    t.integer  "part_of_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "universe_id",           null: false
    t.integer  "birth_instant_id"
    t.integer  "death_instant_id"
    t.integer  "birth_location_id"
    t.integer  "residence_location_id"
    t.integer  "death_location_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "time_groupings", force: :cascade do |t|
    t.integer  "universe_id", null: false
    t.string   "era_name"
    t.string   "slot_1_name"
    t.string   "slot_2_name"
    t.string   "slot_3_name"
    t.string   "slot_4_name"
    t.string   "slot_5_name"
    t.string   "slot_6_name"
    t.string   "slot_7_name"
    t.string   "slot_8_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "time_instants", force: :cascade do |t|
    t.integer  "universe_id", null: false
    t.integer  "era_id",      null: false
    t.integer  "slot_1",      null: false
    t.integer  "slot_2"
    t.integer  "slot_3"
    t.integer  "slot_4"
    t.integer  "slot_5"
    t.integer  "slot_6"
    t.integer  "slot_7"
    t.integer  "slot_8"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "titles", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universes", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
