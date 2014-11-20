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

ActiveRecord::Schema.define(version: 20141120133347) do

  create_table "answers", force: true do |t|
    t.text     "description"
    t.integer  "rank"
    t.integer  "status"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "classrooms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "beginning"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "beginning"
    t.datetime "end"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["classroom_id"], name: "index_events_on_classroom_id"

  create_table "notifications", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "send_time"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["classroom_id"], name: "index_notifications_on_classroom_id"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "rank"
    t.integer  "status"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id"

  create_table "registrations", force: true do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["classroom_id"], name: "index_registrations_on_classroom_id"
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["question_id"], name: "index_subscriptions_on_question_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "parent_topic_id"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["classroom_id"], name: "index_topics_on_classroom_id"
  add_index "topics", ["parent_topic_id"], name: "index_topics_on_parent_topic_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
