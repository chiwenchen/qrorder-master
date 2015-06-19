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

ActiveRecord::Schema.define(version: 20150619081854) do

  create_table "menus", force: true do |t|
    t.string   "dish_name"
    t.string   "description"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "price"
  end

  create_table "orders", force: true do |t|
    t.integer  "menu_id"
    t.integer  "table_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
  end

  create_table "restaurants", force: true do |t|
    t.string "name"
    t.string "img_url"
    t.string "slug"
  end

  create_table "tables", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "number"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "restaurant_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
