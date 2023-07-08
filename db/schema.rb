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

ActiveRecord::Schema[7.0].define(version: 2023_07_07_142610) do
  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_id"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_ratings_on_customer_id"
    t.index ["service_id"], name: "index_ratings_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.string "location"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id"
    t.integer "avg_rating"
    t.index ["admin_id"], name: "index_services_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "type"
  end

end
