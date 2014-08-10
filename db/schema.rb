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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140810031516) do

  create_table "administrators", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "report_id"
    t.integer  "student_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attendances", ["report_id"], :name => "index_attendances_on_report_id"
  add_index "attendances", ["student_id"], :name => "index_attendances_on_student_id"

  create_table "counselors", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
  end

  create_table "reports", :force => true do |t|
    t.integer  "counselor_id"
    t.date     "report_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "reports", ["counselor_id"], :name => "index_reports_on_counselor_id"

  create_table "rooms", :force => true do |t|
    t.integer  "counselor_id"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "rooms", ["counselor_id"], :name => "index_rooms_on_user_id"

  create_table "students", :force => true do |t|
    t.integer  "room_id"
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "exemptions", :default => 0
  end

  add_index "students", ["room_id"], :name => "index_students_on_room_id"

end
