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

ActiveRecord::Schema.define(version: 20190628002857) do

  create_table "changeletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "response_id"
    t.integer  "user_id"
    t.integer  "fromuser_id"
    t.string   "text"
    t.string   "check"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "responsekey"
    t.index ["fromuser_id"], name: "index_changeletters_on_fromuser_id", using: :btree
    t.index ["response_id"], name: "index_changeletters_on_response_id", using: :btree
    t.index ["user_id"], name: "index_changeletters_on_user_id", using: :btree
  end

  create_table "favos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "secret_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secret_id"], name: "index_favos_on_secret_id", using: :btree
    t.index ["user_id"], name: "index_favos_on_user_id", using: :btree
  end

  create_table "friends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sentence"
    t.string   "person"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "looks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "secret_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secret_id"], name: "index_looks_on_secret_id", using: :btree
    t.index ["user_id"], name: "index_looks_on_user_id", using: :btree
  end

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
    t.string   "person"
    t.string   "reason"
    t.index ["fromuser_id"], name: "index_postletters_on_fromuser_id", using: :btree
    t.index ["user_id"], name: "index_postletters_on_user_id", using: :btree
  end

  create_table "recoms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "fromuser_id"
    t.string   "person"
    t.string   "reason"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["fromuser_id"], name: "index_recoms_on_fromuser_id", using: :btree
    t.index ["user_id"], name: "index_recoms_on_user_id", using: :btree
  end

  create_table "responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "fromuser_id"
    t.string   "text"
    t.string   "check"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["fromuser_id"], name: "index_responses_on_fromuser_id", using: :btree
    t.index ["user_id"], name: "index_responses_on_user_id", using: :btree
  end

  create_table "secrets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "lookuser_id"
    t.integer  "likeuser_id"
    t.string   "secrettext"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["likeuser_id"], name: "index_secrets_on_likeuser_id", using: :btree
    t.index ["lookuser_id"], name: "index_secrets_on_lookuser_id", using: :btree
    t.index ["user_id"], name: "index_secrets_on_user_id", using: :btree
  end

  create_table "thinks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "fromuser_id"
    t.string   "person"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["fromuser_id"], name: "index_thinks_on_fromuser_id", using: :btree
    t.index ["user_id"], name: "index_thinks_on_user_id", using: :btree
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

  add_foreign_key "changeletters", "responses"
  add_foreign_key "changeletters", "users"
  add_foreign_key "changeletters", "users", column: "fromuser_id"
  add_foreign_key "favos", "secrets"
  add_foreign_key "favos", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "looks", "secrets"
  add_foreign_key "looks", "users"
  add_foreign_key "postletters", "users"
  add_foreign_key "postletters", "users", column: "fromuser_id"
  add_foreign_key "recoms", "users"
  add_foreign_key "recoms", "users", column: "fromuser_id"
  add_foreign_key "responses", "users"
  add_foreign_key "responses", "users", column: "fromuser_id"
  add_foreign_key "secrets", "users"
  add_foreign_key "secrets", "users", column: "likeuser_id"
  add_foreign_key "secrets", "users", column: "lookuser_id"
  add_foreign_key "thinks", "users"
  add_foreign_key "thinks", "users", column: "fromuser_id"
  add_foreign_key "users", "users", column: "loginshow_id"
end
