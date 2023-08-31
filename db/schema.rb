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

ActiveRecord::Schema.define(version: 2023_08_31_055711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "newsletters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_newsletters_on_email", unique: true
  end

  create_table "opinions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.integer "mark", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_opinions_on_user_id"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "phone_number", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "postal_code", null: false
    t.string "delivery_method", null: false
    t.string "payment_method", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.integer "available_quantity", null: false
    t.string "picture_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "product_category_id", null: false
    t.datetime "promoted_from"
    t.datetime "promoted_to"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "products_orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "order_id", null: false
    t.uuid "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_quantity", null: false
    t.index ["order_id"], name: "index_products_orders_on_order_id"
    t.index ["product_id"], name: "index_products_orders_on_product_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.hstore "avatars", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "phone_number"
    t.string "street"
    t.string "city"
    t.string "postal_code"
  end

  add_foreign_key "opinions", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", name: "orders_user_id_fkey"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products_orders", "orders"
  add_foreign_key "products_orders", "products"
end
