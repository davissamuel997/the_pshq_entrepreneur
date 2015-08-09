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

ActiveRecord::Schema.define(version: 20150809193322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "podcasts", force: :cascade do |t|
    t.string   "name"
    t.datetime "air_date"
    t.integer  "created_by"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "recording_file_name"
    t.string   "recording_content_type"
    t.integer  "recording_file_size"
    t.datetime "recording_updated_at"
  end

  add_index "podcasts", ["created_by"], name: "index_podcasts_on_created_by", using: :btree

end
