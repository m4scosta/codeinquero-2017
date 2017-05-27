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

ActiveRecord::Schema.define(version: 20170527213515) do

  create_table "prizes", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "cost"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quest_rewards", force: :cascade do |t|
    t.integer  "quest_id"
    t.integer  "rewarded_user_id"
    t.integer  "user_id"
    t.integer  "points"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["quest_id"], name: "index_quest_rewards_on_quest_id"
    t.index ["rewarded_user_id"], name: "index_quest_rewards_on_rewarded_user_id"
    t.index ["user_id"], name: "index_quest_rewards_on_user_id"
  end

  create_table "quests", force: :cascade do |t|
    t.integer  "created_by_id"
    t.integer  "user_id"
    t.string   "description"
    t.string   "icon"
    t.integer  "reward_points"
    t.integer  "max_participants"
    t.boolean  "available"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["created_by_id"], name: "index_quests_on_created_by_id"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "rewarding_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_reward_id"
    t.integer  "points"
    t.boolean  "started"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_rewarding_users_on_user_id"
    t.index ["user_reward_id"], name: "index_rewarding_users_on_user_reward_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rewards", force: :cascade do |t|
    t.text     "description"
    t.integer  "rewarded_user_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["rewarded_user_id"], name: "index_user_rewards_on_rewarded_user_id"
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "received_points"
    t.integer  "available_points"
    t.integer  "points_to_give"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
