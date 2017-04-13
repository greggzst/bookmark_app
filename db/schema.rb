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

ActiveRecord::Schema.define(version: 20170413210704) do

  create_table "bookmark_tags", force: :cascade do |t|
    t.integer  "bookmark_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bookmark_id"], name: "index_bookmark_tags_on_bookmark_id"
    t.index ["tag_id"], name: "index_bookmark_tags_on_tag_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "short_url"
    t.integer  "website_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["website_id"], name: "index_bookmarks_on_website_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "websites", force: :cascade do |t|
    t.string "url"
  end

end
