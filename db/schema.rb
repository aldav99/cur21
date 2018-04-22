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

ActiveRecord::Schema.define(version: 20180422051401) do

  create_table "answers", force: :cascade do |t|
    t.boolean  "correct",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "answer_id"
  end

  add_index "questions", ["answer_id"], name: "index_questions_on_answer_id"
  add_index "questions", ["test_id"], name: "index_questions_on_test_id"

  create_table "tests", force: :cascade do |t|
    t.string   "title",                   null: false
    t.integer  "level",       default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tests", ["category_id"], name: "index_tests_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.boolean  "pass"
    t.integer  "try"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end