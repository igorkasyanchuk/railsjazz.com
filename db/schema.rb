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

ActiveRecord::Schema.define(:version => 20110110172452) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.boolean  "approved",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_categories", :force => true do |t|
    t.string "name"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "technologies"
    t.date     "completed_on"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "preview_image_file_name"
    t.string   "preview_image_content_type"
    t.integer  "preview_image_file_size"
    t.datetime "preview_image_updated_at"
    t.integer  "project_category_id"
    t.boolean  "featured",                     :default => false
    t.string   "portfolio_image_file_name"
    t.string   "portfolio_image_content_type"
    t.integer  "portfolio_image_file_size"
    t.datetime "portfolio_image_updated_at"
    t.string   "summary"
    t.string   "cached_slug"
  end

  add_index "projects", ["cached_slug"], :name => "index_projects_on_cached_slug", :unique => true
  add_index "projects", ["project_category_id"], :name => "index_projects_on_project_category_id"

  create_table "screenshots", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  add_index "screenshots", ["project_id"], :name => "index_screenshots_on_project_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
