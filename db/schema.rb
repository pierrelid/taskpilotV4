# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_080451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_landing_pages_on_team_id"
  end

  create_table "list_lines", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "list_id", null: false
    t.bigint "quote_id", null: false
    t.bigint "step_id"
    t.boolean "finish", default: false
    t.boolean "waiting", default: false
    t.integer "seconds_to_wait", default: 0
    t.datetime "waiting_start"
    t.index ["list_id"], name: "index_list_lines_on_list_id"
    t.index ["quote_id"], name: "index_list_lines_on_quote_id"
    t.index ["step_id"], name: "index_list_lines_on_step_id"
  end

  create_table "lists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "qualification_id", null: false
    t.bigint "product_id", null: false
    t.string "name"
    t.bigint "team_id", null: false
    t.index ["product_id"], name: "index_lists_on_product_id"
    t.index ["qualification_id"], name: "index_lists_on_qualification_id"
    t.index ["team_id"], name: "index_lists_on_team_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "body"
    t.bigint "quote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quote_id"], name: "index_messages_on_quote_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.boolean "default", default: false
    t.index ["team_id"], name: "index_products_on_team_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.boolean "default", default: false
    t.boolean "initial", default: false
    t.index ["team_id"], name: "index_qualifications_on_team_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.bigint "product_id", null: false
    t.bigint "qualification_id", null: false
    t.string "phone"
    t.index ["product_id"], name: "index_quotes_on_product_id"
    t.index ["qualification_id"], name: "index_quotes_on_qualification_id"
    t.index ["team_id"], name: "index_quotes_on_team_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "workflow_id", null: false
    t.string "title"
    t.text "body"
    t.integer "position", default: 0
    t.integer "delay", default: 0
    t.index ["type"], name: "index_steps_on_type"
    t.index ["workflow_id"], name: "index_steps_on_workflow_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.bigint "team_id", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "list_id", null: false
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.index ["list_id"], name: "index_workflows_on_list_id"
    t.index ["user_id"], name: "index_workflows_on_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "landing_pages", "teams"
  add_foreign_key "list_lines", "lists"
  add_foreign_key "list_lines", "quotes"
  add_foreign_key "list_lines", "steps"
  add_foreign_key "lists", "products"
  add_foreign_key "lists", "qualifications"
  add_foreign_key "lists", "teams"
  add_foreign_key "messages", "quotes"
  add_foreign_key "products", "teams"
  add_foreign_key "qualifications", "teams"
  add_foreign_key "quotes", "products"
  add_foreign_key "quotes", "qualifications"
  add_foreign_key "quotes", "teams"
  add_foreign_key "steps", "workflows"
  add_foreign_key "users", "teams"
  add_foreign_key "workflows", "lists"
  add_foreign_key "workflows", "users"
end
