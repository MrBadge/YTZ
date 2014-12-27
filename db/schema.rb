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

ActiveRecord::Schema.define(version: 20141227090238) do

  create_table "filling_utz_answers", force: true do |t|
    t.string   "text"
    t.integer  "filling_utz_interval_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "filling_utz_answers", ["filling_utz_interval_id"], name: "index_filling_utz_answers_on_filling_utz_interval_id"

  create_table "filling_utz_intervals", force: true do |t|
    t.integer  "start"
    t.integer  "end"
    t.string   "answer"
    t.integer  "filling_utz_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "filling_utzs", force: true do |t|
    t.string   "name"
    t.text     "hint"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "text"
  end

  create_table "images_sort_utz_pictures", force: true do |t|
    t.text     "src"
    t.integer  "ordering"
    t.integer  "images_sort_utz_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "images_sort_utz_pictures", ["images_sort_utz_id"], name: "index_images_sort_utz_pictures_on_images_sort_utz_id"

  create_table "images_sort_utzs", force: true do |t|
    t.text     "goal"
    t.text     "theme"
    t.string   "hint"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matching_utz_answers", force: true do |t|
    t.text     "text"
    t.integer  "matching_utz_question_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "matching_utz_questions", force: true do |t|
    t.text     "text"
    t.integer  "matching_utz_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "matching_utzs", force: true do |t|
    t.string   "name"
    t.text     "hint"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_utz_answers", force: true do |t|
    t.text     "text"
    t.boolean  "is_correct"
    t.integer  "test_utz_question_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "test_utz_answers", ["test_utz_question_id"], name: "index_test_utz_answers_on_test_utz_question_id"

  create_table "test_utz_questions", force: true do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_correction_utzs", force: true do |t|
    t.string   "name"
    t.text     "text_with_errors"
    t.text     "text_without_errors"
    t.integer  "errors_count"
    t.string   "hint"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
