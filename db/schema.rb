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

ActiveRecord::Schema.define(version: 20160718175351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_rooms", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "entry_at"
  end

  add_index "class_rooms", ["student_id", "course_id"], name: "index_class_rooms_on_student_id_and_course_id", unique: true, using: :btree

  create_table "courses", force: :cascade do |t|
    t.string  "name",        limit: 45
    t.string  "description", limit: 45
    t.integer "status"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name",            limit: 45
    t.string  "register_number", limit: 45
    t.integer "status"
  end

  add_foreign_key "class_rooms", "courses"
  add_foreign_key "class_rooms", "students"
end
