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

ActiveRecord::Schema.define(version: 20161117210013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "name"
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
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "applications", force: :cascade do |t|
    t.string   "student_characteristics"
    t.string   "student_interests"
    t.string   "student_answer"
    t.string   "opportunity_value"
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "portfolio"
    t.boolean  "selected",                default: false
    t.integer  "rating",                  default: 0
  end

  add_index "applications", ["opportunity_id", "user_id"], name: "index_applications_on_opportunity_id_and_user_id", using: :btree

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

  create_table "learnt_languages", force: :cascade do |t|
    t.integer "language_id"
    t.integer "student_id"
    t.string  "language_level"
  end

  create_table "majors", force: :cascade do |t|
    t.string   "major_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors_opportunities", id: false, force: :cascade do |t|
    t.integer "major_id",       null: false
    t.integer "opportunity_id", null: false
  end

  create_table "majors_students", id: false, force: :cascade do |t|
    t.integer "major_id",   null: false
    t.integer "student_id", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer  "opportunity_type"
    t.string   "opportunity_title"
    t.text     "activity_description"
    t.text     "skills_description"
    t.boolean  "other_majors"
    t.string   "question_for_student"
    t.date     "date_ini"
    t.string   "opportunity_duration"
    t.integer  "availability"
    t.integer  "cost_or_offer_option"
    t.string   "opportunity_cost"
    t.boolean  "receive_portfolio"
    t.integer  "number_of_students"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "user_id"
    t.boolean  "approved_state",            default: false
    t.integer  "date_ini_type",             default: 0
    t.integer  "opportunity_duration_type", default: 0
    t.boolean  "closed",                    default: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "profession"
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "sector_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "university_id"
    t.integer  "major_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "ed_level_id"
    t.string   "last_semester"
    t.float    "gpa"
    t.integer  "exchange_student"
    t.string   "exchange_university"
    t.string   "highschool"
    t.string   "gpa_max"
    t.integer  "country_id"
    t.integer  "work_xp"
    t.string   "xp_company"
    t.text     "xp_position"
    t.text     "xp_achievements"
    t.integer  "volunteer_xp"
    t.string   "volunteer_org"
    t.text     "volunteer_functions"
    t.integer  "programming_skills"
    t.text     "programing_languages"
    t.text     "strengths"
    t.text     "areas_to_develop"
    t.text     "hobbies"
    t.string   "avatar"
    t.integer  "type_of_student"
    t.string   "other_major"
    t.string   "other_university"
    t.integer  "second_university_id"
    t.integer  "second_major_id"
    t.integer  "second_ed_level_id"
    t.string   "other_tools_skills"
    t.string   "second_xp_company"
    t.text     "second_xp_position"
    t.text     "second_xp_achievements"
    t.string   "third_xp_company"
    t.text     "third_xp_position"
    t.text     "third_xp_achievements"
    t.string   "second_volunteer_org"
    t.text     "second_volunteer_functions"
    t.string   "third_volunteer_org"
    t.text     "third_volunteer_functions"
    t.string   "second_other_major"
    t.string   "second_other_university"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "other_city"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
