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

ActiveRecord::Schema.define(version: 20150211090929) do

  create_table "accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accesses", ["project_id"], name: "index_accesses_on_project_id"
  add_index "accesses", ["user_id"], name: "index_accesses_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "user_id"
    t.string   "action"
    t.integer  "project_id"
    t.string   "extra_1"
    t.string   "extra_2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["project_id"], name: "index_events_on_project_id"
  add_index "events", ["source_id", "source_type"], name: "index_events_on_source_id_and_source_type"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "memberships", force: :cascade do |t|
    t.string   "role",       limit: 20
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "private",     default: false
    t.integer  "team_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "todo_lists", ["project_id"], name: "index_todo_lists_on_project_id"

  create_table "todos", force: :cascade do |t|
    t.text     "content",      limit: 2014
    t.integer  "todo_list_id"
    t.datetime "completed_on"
    t.boolean  "active",                    default: false
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "deleted_at"
    t.boolean  "finished",                  default: false
    t.datetime "expiry_on"
  end

  add_index "todos", ["todo_list_id"], name: "index_todos_on_todo_list_id"
  add_index "todos", ["user_id"], name: "index_todos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
