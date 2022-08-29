# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_29_015152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgroonga"
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "title_en", default: "", null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_article_categories_on_title", unique: true
  end

  create_table "article_likes", force: :cascade do |t|
    t.integer "article_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id", "user_id"], name: "index_article_likes_on_article_id_and_user_id", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.string "summary", default: "", null: false
    t.integer "article_category_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "article_id", default: 0, null: false
    t.integer "comment_type", default: 0, null: false
    t.integer "comment_id", default: 0, null: false
    t.integer "from_uid", default: 0, null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["from_uid"], name: "index_comments_on_from_uid"
  end

  create_table "rich_texts", force: :cascade do |t|
    t.string "record_type", default: "", null: false
    t.integer "record_id", default: 0, null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body"], name: "pgroonga_plain_text_body_index", using: :pgroonga
    t.index ["record_type", "record_id"], name: "index_rich_texts_on_record_type_and_record_id", unique: true
  end

  create_table "user_article_categories", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.integer "article_category_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "nick_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
