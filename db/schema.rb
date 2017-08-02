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

ActiveRecord::Schema.define(version: 20170802090122) do

  create_table "activities", force: :cascade do |t|
    t.datetime "time"
    t.text "content"
    t.integer "site_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_activities_on_site_id"
    t.index ["topic_id"], name: "index_activities_on_topic_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrolls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_enrolls_on_activity_id"
    t.index ["user_id"], name: "index_enrolls_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user1"
    t.integer "user2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_topics", id: false, force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "topic_id", null: false
    t.index ["tag_id"], name: "index_tags_topics_on_tag_id"
    t.index ["topic_id"], name: "index_tags_topics_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_topics_on_category_id"
  end

  create_table "topics_subtopics", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topics_subtopics_on_topic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar"
    t.string "nickname"
    t.string "wechat"
    t.string "mobile"
    t.string "name"
    t.integer "gender", default: 0
    t.string "school"
    t.string "grade"
    t.string "major"
    t.boolean "completed", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
