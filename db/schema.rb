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

ActiveRecord::Schema.define(version: 2019_03_29_193016) do

  create_table "bookings", force: :cascade do |t|
    t.integer "itinerary_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["itinerary_id"], name: "index_bookings_on_itinerary_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "event_receivers", force: :cascade do |t|
    t.integer "event_id"
    t.integer "receiver_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_receivers_on_event_id"
    t.index ["receiver_id"], name: "index_event_receivers_on_receiver_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.text "date"
    t.text "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_friendships_on_receiver_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "destination_name"
    t.string "destination_address"
    t.string "airline"
    t.string "flight_number"
    t.string "gate_number"
    t.string "seat_number"
    t.string "departure_airport_code"
    t.string "departure_date"
    t.string "departure_flight_time"
    t.string "return_airport_code"
    t.string "return_date"
    t.string "return_flight_time"
    t.integer "user_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_itineraries_on_receiver_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
