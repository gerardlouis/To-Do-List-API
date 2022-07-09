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

ActiveRecord::Schema[7.0].define(version: 2022_07_09_202422) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "td_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "td_list_id", null: false
    t.index ["td_list_id"], name: "index_td_categories_on_td_list_id"
  end

  create_table "td_list_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "due_date"
    t.integer "priority"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "td_category_id", null: false
    t.index ["td_category_id"], name: "index_td_list_items_on_td_category_id"
  end

  create_table "td_lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "td_categories", "td_lists"
  add_foreign_key "td_list_items", "td_categories"
end
