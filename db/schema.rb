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

ActiveRecord::Schema.define(version: 20160928034656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "position"
    t.string   "company_address"
    t.string   "company_nit"
    t.text     "company_description"
    t.string   "company_size"
    t.string   "company_website_url"
    t.integer  "company_sector_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "education_levels", force: :cascade do |t|
    t.string   "level_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string   "major_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer  "opportunity_type"
    t.string   "opportunity_title"
    t.text     "activity_description"
    t.text     "skills_description"
    t.integer  "major_id"
    t.boolean  "other_majors"
    t.string   "question_for_student"
    t.date     "date_ini"
    t.string   "opportunity_duration"
    t.integer  "availability"
    t.integer  "cost_or_offer_option"
    t.integer  "opportunity_cost"
    t.boolean  "receive_portfolio"
    t.integer  "number_of_students"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "opportunities_users", id: false, force: :cascade do |t|
    t.integer "opportunity_id", null: false
    t.integer "user_id",        null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "sector_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "university_id"
    t.integer  "major_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.integer  "ed_level_id"
    t.string   "last_semester"
    t.float    "gpa"
    t.boolean  "exchange_student"
    t.string   "exchange_university"
    t.string   "highschool"
    t.string   "gpa_max"
    t.integer  "country_id"
    t.boolean  "work_xp"
    t.string   "xp_company"
    t.text     "xp_position"
    t.text     "xp_achievements"
    t.boolean  "volunteer_xp"
    t.string   "volunteer_org"
    t.text     "volunteer_functions"
    t.integer  "language_id"
    t.string   "language_level"
    t.boolean  "programming_skills"
    t.text     "programing_languages"
    t.text     "strengths"
    t.text     "areas_to_develop"
    t.text     "hobbies"
  end

  create_table "students_tools", id: false, force: :cascade do |t|
    t.integer "tool_id",    null: false
    t.integer "student_id", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string   "tool_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string   "university_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "promo_id"
    t.string   "referenced_by"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "document_number"
    t.string   "mobile_phone"
    t.integer  "city_id"
    t.integer  "country_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
