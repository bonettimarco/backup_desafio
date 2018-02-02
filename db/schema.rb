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

ActiveRecord::Schema.define(version: 20180202043433) do

  create_table "documentos", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.float    "total",             default: 0.0
  end

  create_table "stores", force: :cascade do |t|
    t.string   "purchaser_name"
    t.string   "item_description"
    t.float    "item_price",       default: 0.0
    t.integer  "purchase_count",   default: 0
    t.string   "merchant_address"
    t.string   "merchant_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
