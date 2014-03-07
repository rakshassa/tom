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

ActiveRecord::Schema.define(version: 20140307031802) do

  create_table "address_type_relations", force: true do |t|
    t.integer  "address_id"
    t.integer  "addresstype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_type_relations", ["address_id", "addresstype_id"], name: "index_address_type_relations_on_address_id_and_addresstype_id", unique: true
  add_index "address_type_relations", ["address_id"], name: "index_address_type_relations_on_address_id"

  create_table "addresses", force: true do |t|
    t.boolean  "is_primary"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresstypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_address_relationships", force: true do |t|
    t.integer  "vendor_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendor_address_relationships", ["vendor_id", "address_id"], name: "index_vendor_address_relationships_on_vendor_id_and_address_id", unique: true
  add_index "vendor_address_relationships", ["vendor_id"], name: "index_vendor_address_relationships_on_vendor_id"

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
