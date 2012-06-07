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

ActiveRecord::Schema.define(:version => 20120603042940) do

  create_table "actives", :force => true do |t|
    t.integer  "trail_id"
    t.date     "startDate"
    t.time     "startTime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "asset"
    t.string   "gate"
    t.string   "trail"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "type"
    t.integer  "trail_id"
    t.string   "assetkind"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "gateAnswer"
    t.string   "gateAction"
    t.string   "assetDesc"
  end

  create_table "clues", :force => true do |t|
    t.string   "chapter"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "typeof"
    t.integer  "chapter_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "theclue"
  end

  create_table "creations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trail_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "live_trails", :force => true do |t|
    t.integer  "trail_id"
    t.boolean  "recuring"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "trails", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "twitter"
    t.string   "category"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.boolean  "status"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "recurring"
    t.integer  "active_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
    t.string   "typeof"
  end

end
