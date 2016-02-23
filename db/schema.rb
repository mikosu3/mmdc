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

ActiveRecord::Schema.define(version: 20160223130701) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",         limit: 100, null: false
    t.string   "url",          limit: 255
    t.string   "twitter",      limit: 255
    t.string   "pixiv",        limit: 255
    t.string   "email",        limit: 255
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "update_by",    limit: 255
    t.string   "nico",         limit: 255
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree

  create_table "credit_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "credit_id",  limit: 4
    t.integer  "author_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "credit_logs", ["author_id"], name: "index_credit_logs_on_author_id", using: :btree
  add_index "credit_logs", ["credit_id"], name: "index_credit_logs_on_credit_id", using: :btree
  add_index "credit_logs", ["user_id"], name: "index_credit_logs_on_user_id", using: :btree

  create_table "credits", force: :cascade do |t|
    t.string   "distribution", limit: 255, null: false
    t.integer  "lock_version", limit: 4
    t.integer  "wanted_id",    limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "author_id",    limit: 4
    t.string   "name",         limit: 255
    t.string   "url",          limit: 255
  end

  add_index "credits", ["author_id"], name: "index_credits_on_author_id", using: :btree
  add_index "credits", ["wanted_id"], name: "index_credits_on_wanted_id", using: :btree

  create_table "emms", force: :cascade do |t|
    t.string   "original_name",  limit: 255, null: false
    t.string   "save_file_name", limit: 255, null: false
    t.integer  "lock_version",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "video_id",       limit: 4
  end

  create_table "infos", force: :cascade do |t|
    t.date     "date"
    t.string   "title",        limit: 255,   null: false
    t.text     "note",         limit: 65535
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "mmd_objects", force: :cascade do |t|
    t.string   "extension",    limit: 10,  null: false
    t.string   "file_name",    limit: 200, null: false
    t.string   "folder_name",  limit: 200, null: false
    t.string   "full_path",    limit: 255, null: false
    t.integer  "lock_version", limit: 4
    t.integer  "emm_id",       limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "mmd_objects", ["emm_id"], name: "index_mmd_objects_on_emm_id", using: :btree
  add_index "mmd_objects", ["file_name", "folder_name", "extension"], name: "index_mmd_objects_on_file_name_and_folder_name_and_extension", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "is_admin",                        default: false, null: false
    t.string   "screen_name",         limit: 255,                 null: false
    t.integer  "twitter_user_id",     limit: 4,                   null: false
    t.integer  "lock_version",        limit: 4
    t.string   "access_token",        limit: 255,                 null: false
    t.string   "access_token_secret", limit: 255,                 null: false
    t.string   "ticket",              limit: 255,                 null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",      limit: 4
    t.integer  "lock_version", limit: 4
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

  create_table "wanteds", force: :cascade do |t|
    t.string   "file_name",    limit: 200, null: false
    t.string   "folder_name",  limit: 200, null: false
    t.string   "extension",    limit: 10,  null: false
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "wanteds", ["file_name", "folder_name", "extension"], name: "index_wanteds_on_file_name_and_folder_name_and_extension", unique: true, using: :btree

  add_foreign_key "credit_logs", "authors"
  add_foreign_key "credit_logs", "credits"
  add_foreign_key "credit_logs", "users"
  add_foreign_key "credits", "authors"
  add_foreign_key "credits", "wanteds"
  add_foreign_key "mmd_objects", "emms"
  add_foreign_key "videos", "users"
end
