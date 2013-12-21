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

ActiveRecord::Schema.define(:version => 20131220080145) do

  create_table "relationships", :force => true do |t|
    t.integer  "admirer_id"
    t.integer  "inspirer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["admirer_id"], :name => "index_relationships_on_admirer_id"
  add_index "relationships", ["inspirer_id"], :name => "index_relationships_on_inspirer_id"

  create_table "sapiens", :force => true do |t|
    t.string   "agnomen"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "sapiens", ["email"], :name => "index_sapiens_on_email", :unique => true
  add_index "sapiens", ["reset_password_token"], :name => "index_sapiens_on_reset_password_token", :unique => true

  create_table "thoughts", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "sapien_id"
    t.boolean  "private",    :default => false
    t.integer  "hearts",     :default => 0
  end

  add_index "thoughts", ["sapien_id"], :name => "index_thoughts_on_sapien_id"

end
