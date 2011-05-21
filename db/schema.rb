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

ActiveRecord::Schema.define(:version => 20110521212143) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "start_time"
    t.integer  "end_time"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_scores", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.integer "points"
  end

  create_table "players", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.integer  "team_id"
    t.integer  "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_key"
  end

  create_table "teams", :force => true do |t|
    t.integer  "game_id"
    t.integer  "controller_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
