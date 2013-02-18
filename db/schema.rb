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

ActiveRecord::Schema.define(:version => 20130218060026) do

  create_table "images", :force => true do |t|
    t.integer "photo_id",                     :null => false
    t.boolean "original",  :default => false, :null => false
    t.string  "mime_type",                    :null => false
    t.integer "size",                         :null => false
    t.integer "width",                        :null => false
    t.integer "height",                       :null => false
  end

  add_index "images", ["photo_id", "original"], :name => "index_images_on_photo_id_and_original"

  create_table "photos", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "users", :force => true do |t|
    t.string "email",                         :null => false
    t.string "password_digest", :limit => 60, :null => false
    t.string "first_name"
    t.string "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
