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

ActiveRecord::Schema.define(version: 20190509081726) do

  create_table "postletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "fromuser_id"
    t.string   "text"
    t.string   "which"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "check"
    t.time     "disclosure_at"
    t.string   "timercheck"
    t.string   "howtimer"
    t.string   "account"
    t.index ["fromuser_id"], name: "index_postletters_on_fromuser_id", using: :btree
    t.index ["user_id"], name: "index_postletters_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "loginuser_id"
    t.integer  "loginshow_id"
    t.index ["loginshow_id"], name: "index_users_on_loginshow_id", using: :btree
    t.index ["loginuser_id"], name: "index_users_on_loginuser_id", using: :btree
  end

  add_foreign_key "postletters", "users"
  add_foreign_key "postletters", "users", column: "fromuser_id"
  add_foreign_key "users", "users", column: "loginshow_id"
end
