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

ActiveRecord::Schema.define(:version => 20130328214419) do

  create_table "attendees", :force => true do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.text    "status"
  end

  create_table "competitions", :force => true do |t|
    t.text     "name"
    t.date     "start_date"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.date     "date"
    t.datetime "time"
    t.text     "opponent"
    t.text     "location"
    t.boolean  "win"
    t.integer  "points_for"
    t.integer  "points_against"
    t.text     "comments"
    t.integer  "competition_id"
    t.integer  "team_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "teams", :force => true do |t|
    t.text     "team_name"
    t.text     "sport"
    t.text     "timezone"
    t.text     "team_gender"
    t.text     "manager"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams_users", :force => true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "gender"
    t.string   "password_digest"
    t.text     "current_team"
    t.text     "positions"
    t.text     "image"
    t.integer  "team_id"
    t.boolean  "is_manager",      :default => false
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
