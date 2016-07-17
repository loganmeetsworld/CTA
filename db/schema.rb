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

ActiveRecord::Schema.define(version: 20160717050901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "route_stops", id: false, force: :cascade do |t|
    t.integer  "stop_id"
    t.integer  "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_stops_on_route_id", using: :btree
    t.index ["stop_id"], name: "index_route_stops_on_stop_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.string   "route_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["route_number"], name: "index_routes_on_route_number", unique: true, using: :btree
  end

  create_table "stops", force: :cascade do |t|
    t.integer  "stop_id"
    t.string   "on_street"
    t.string   "cross_street"
    t.integer  "boardings"
    t.integer  "alightings"
    t.string   "month_beginning"
    t.string   "daytype"
    t.decimal  "latitude",        precision: 10, scale: 6
    t.decimal  "longitude",       precision: 10, scale: 6
    t.string   "routes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stop_id"], name: "index_stops_on_stop_id", unique: true, using: :btree
  end

end
