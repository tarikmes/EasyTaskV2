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

ActiveRecord::Schema.define(version: 20160523105530) do

  create_table "comments", force: :cascade do |t|
    t.integer  "created_by"
    t.text     "body"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "commenter"
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id"

  create_table "resources", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity"
  end

  create_table "task_statuses", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",           limit: 100
    t.string   "description"
    t.integer  "estimate"
    t.integer  "user_id"
    t.integer  "task_status_id",             default: 1
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "created_by"
    t.integer  "parent_task_id"
    t.integer  "is_parent",                  default: 0
    t.integer  "logged_time"
    t.integer  "parcent_done",               default: 0
  end

  create_table "used_resources", force: :cascade do |t|
    t.integer  "used"
    t.integer  "task_id"
    t.integer  "resource_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 50
    t.string   "username",        limit: 50
    t.string   "password_digest"
    t.string   "email",           limit: 150
    t.integer  "user_type_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
