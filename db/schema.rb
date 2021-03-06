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

ActiveRecord::Schema.define(:version => 20111120133554) do

  create_table "attachments", :force => true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_videos", :force => true do |t|
    t.string   "code"
    t.integer  "book_id"
    t.text     "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "text"
    t.string   "ip"
    t.datetime "created_at"
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "excerpt"
    t.text     "body"
    t.integer  "state",                         :default => 0
    t.datetime "publish_date"
    t.integer  "user_id"
    t.integer  "comments_count",                :default => 0
    t.string   "tags",           :limit => nil
    t.string   "categories",     :limit => nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "video_code"
  end

  create_table "stats", :force => true do |t|
    t.integer "post_id"
    t.integer "month"
    t.integer "year"
    t.integer "visits",  :default => 0
  end

  add_index "stats", ["month"], :name => "index_stats_on_month"
  add_index "stats", ["post_id"], :name => "index_stats_on_post_id"
  add_index "stats", ["visits"], :name => "index_stats_on_visits"
  add_index "stats", ["year"], :name => "index_stats_on_year"

  create_table "users", :force => true do |t|
    t.string   "name_and_surname"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "newsletter",           :default => true
    t.integer  "sex"
    t.string   "avatar"
    t.string   "confirmation_token"
    t.string   "login"
    t.string   "password_reset_token"
  end

end
