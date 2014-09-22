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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140920021519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.boolean  "approved",   default: false
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stage_name"
  end

  add_index "actors", ["first", "last"], name: "index_actors_on_first_and_last", using: :btree
  add_index "actors", ["first"], name: "index_actors_on_first", using: :btree
  add_index "actors", ["last"], name: "index_actors_on_last", using: :btree

  create_table "directors", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.boolean  "approved",   default: false
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stage_name"
  end

  add_index "directors", ["first", "last", "birthday"], name: "index_directors_on_first_and_last_and_birthday", unique: true, using: :btree
  add_index "directors", ["first", "last"], name: "index_directors_on_first_and_last", using: :btree
  add_index "directors", ["first"], name: "index_directors_on_first", using: :btree
  add_index "directors", ["last"], name: "index_directors_on_last", using: :btree

  create_table "directors_movies", force: true do |t|
    t.integer  "movie_id"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directors_movies", ["director_id"], name: "index_directors_movies_on_director_id", using: :btree
  add_index "directors_movies", ["movie_id", "director_id"], name: "index_directors_movies_on_movie_id_and_director_id", unique: true, using: :btree
  add_index "directors_movies", ["movie_id"], name: "index_directors_movies_on_movie_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["name"], name: "index_genres_on_name", using: :btree
  add_index "genres", ["slug"], name: "index_genres_on_slug", using: :btree

  create_table "genres_movies", force: true do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres_movies", ["genre_id", "movie_id"], name: "index_genres_movies_on_genre_id_and_movie_id", unique: true, using: :btree
  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id", using: :btree
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id", using: :btree

  create_table "glogs", force: true do |t|
    t.text     "log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "name"
    t.date     "opening_day"
    t.text     "teaser"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spoiler_id"
  end

  add_index "movies", ["name"], name: "index_movies_on_name", using: :btree
  add_index "movies", ["opening_day"], name: "index_movies_on_opening_day", using: :btree
  add_index "movies", ["user_id"], name: "index_movies_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.text     "review"
    t.float    "stars"
    t.boolean  "review_present", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["movie_id"], name: "index_ratings_on_movie_id", using: :btree
  add_index "ratings", ["stars"], name: "index_ratings_on_stars", using: :btree
  add_index "ratings", ["user_id", "movie_id"], name: "index_ratings_on_user_id_and_movie_id", unique: true, using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["actor_id", "movie_id", "name"], name: "index_roles_on_actor_id_and_movie_id_and_name", unique: true, using: :btree
  add_index "roles", ["actor_id", "movie_id"], name: "index_roles_on_actor_id_and_movie_id", using: :btree
  add_index "roles", ["actor_id"], name: "index_roles_on_actor_id", using: :btree
  add_index "roles", ["movie_id"], name: "index_roles_on_movie_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "spoilers", force: true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.text     "synopsis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spoilers", ["movie_id"], name: "index_spoilers_on_movie_id", using: :btree
  add_index "spoilers", ["user_id"], name: "index_spoilers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "chosen_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.text     "log"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
