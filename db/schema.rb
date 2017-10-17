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

ActiveRecord::Schema.define(version: 20171004211339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Benefits_Opportunities", id: false, force: :cascade do |t|
    t.bigint "Benefit_id", null: false
    t.bigint "Opportunity_id", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.string "student_characteristics"
    t.string "student_interests"
    t.string "student_answer"
    t.string "opportunity_value"
    t.integer "user_id"
    t.integer "opportunity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "portfolio"
    t.boolean "selected", default: false
    t.integer "rating", default: 0
    t.index ["opportunity_id", "user_id"], name: "index_applications_on_opportunity_id_and_user_id"
  end

  create_table "benefits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "position"
    t.string "company_address"
    t.string "company_nit"
    t.text "company_description"
    t.string "company_size"
    t.string "company_website_url"
    t.integer "company_sector_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_levels", force: :cascade do |t|
    t.string "level_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learnt_languages", force: :cascade do |t|
    t.integer "language_id"
    t.integer "student_id"
    t.string "language_level"
  end

  create_table "majors", force: :cascade do |t|
    t.string "major_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors_opportunities", id: false, force: :cascade do |t|
    t.bigint "major_id", null: false
    t.bigint "opportunity_id", null: false
  end

  create_table "majors_students", id: false, force: :cascade do |t|
    t.bigint "major_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "notification_posts", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notification_posts_on_user_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "opportunity_type"
    t.string "opportunity_title"
    t.text "activity_description"
    t.text "skills_description"
    t.boolean "other_majors"
    t.string "question_for_student"
    t.date "date_ini"
    t.string "opportunity_duration"
    t.integer "availability"
    t.integer "cost_or_offer_option"
    t.string "opportunity_cost"
    t.boolean "receive_portfolio"
    t.integer "number_of_students"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "approved_state", default: false
    t.integer "date_ini_type", default: 0
    t.integer "opportunity_duration_type", default: 0
    t.boolean "closed", default: false
    t.string "description"
    t.string "schedule"
    t.integer "contract_type"
    t.integer "city_id"
    t.text "salary"
    t.integer "compensatory_time_off"
    t.text "legal_benefits"
  end

  create_table "people", force: :cascade do |t|
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "profession"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "sector_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "university_id"
    t.integer "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ed_level_id"
    t.string "last_semester"
    t.float "gpa"
    t.integer "exchange_student"
    t.string "exchange_university"
    t.string "highschool"
    t.string "gpa_max"
    t.integer "country_id"
    t.integer "work_xp"
    t.string "xp_company"
    t.text "xp_position"
    t.text "xp_achievements"
    t.integer "volunteer_xp"
    t.string "volunteer_org"
    t.text "volunteer_functions"
    t.integer "programming_skills"
    t.text "programing_languages"
    t.text "strengths"
    t.text "areas_to_develop"
    t.text "hobbies"
    t.string "avatar"
    t.integer "type_of_student"
    t.string "other_major"
    t.string "other_university"
    t.string "other_tools_skills"
    t.integer "second_university_id"
    t.integer "second_major_id"
    t.integer "second_ed_level_id"
    t.string "second_xp_company"
    t.text "second_xp_position"
    t.text "second_xp_achievements"
    t.string "third_xp_company"
    t.text "third_xp_position"
    t.text "third_xp_achievements"
    t.string "second_volunteer_org"
    t.text "second_volunteer_functions"
    t.string "third_volunteer_org"
    t.text "third_volunteer_functions"
    t.string "second_other_major"
    t.string "second_other_university"
  end

  create_table "students_tools", id: false, force: :cascade do |t|
    t.bigint "tool_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "tool_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_state"
    t.string "plan"
    t.string "reference_number"
    t.string "pol_transaction_state"
    t.string "pol_response_code"
    t.string "description"
    t.string "lap_response_code"
    t.string "lap_transaction_state"
    t.string "reference_code"
    t.string "reference_pol"
    t.string "transaction_id"
    t.string "lap_payment_method"
    t.string "lap_payment_method_type"
    t.string "pse_bank"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amount"
  end

  create_table "universities", force: :cascade do |t|
    t.string "university_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "promo_id"
    t.string "referenced_by"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "document_number"
    t.string "mobile_phone"
    t.integer "city_id"
    t.integer "country_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "other_city"
    t.string "credits", default: "0"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "notification_posts", "users"
end
