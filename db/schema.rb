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

ActiveRecord::Schema.define(version: 20180422191315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "menus_appeared"
    t.integer "times_appeared"
    t.integer "first_appeared"
    t.integer "last_appeared"
    t.decimal "lowest_price"
    t.decimal "highest_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "import_tasks", force: :cascade do |t|
    t.string "importer_type", null: false
    t.string "file"
    t.string "log"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "finished_processing_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_type"
  end

  create_table "menu_items", force: :cascade do |t|
    t.decimal "price", precision: 8, scale: 3
    t.decimal "high_price", precision: 8, scale: 3
    t.decimal "xpos", precision: 8, scale: 3
    t.decimal "ypos", precision: 8, scale: 3
    t.bigint "menu_page_id"
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menu_items_on_dish_id"
    t.index ["menu_page_id"], name: "index_menu_items_on_menu_page_id"
  end

  create_table "menu_pages", force: :cascade do |t|
    t.integer "page_number"
    t.integer "full_height"
    t.integer "full_width"
    t.bigint "image_id"
    t.string "uuid"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_pages_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.string "call_number"
    t.string "keywords"
    t.string "language"
    t.bigint "sponsor_id"
    t.bigint "event_id"
    t.bigint "venue_id"
    t.bigint "place_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "physical_description"
    t.datetime "date"
    t.string "status"
    t.integer "page_count"
    t.integer "dish_count"
    t.string "currency"
    t.string "currency_symbol"
    t.integer "occasion_id"
    t.index ["event_id"], name: "index_menus_on_event_id"
    t.index ["location_id"], name: "index_menus_on_location_id"
    t.index ["place_id"], name: "index_menus_on_place_id"
    t.index ["sponsor_id"], name: "index_menus_on_sponsor_id"
    t.index ["venue_id"], name: "index_menus_on_venue_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
