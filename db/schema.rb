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

ActiveRecord::Schema[7.0].define(version: 2024_05_24_091748) do
  create_table "answers", force: :cascade do |t|
    t.text "reply"
    t.integer "question_id", null: false
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_answers_on_employee_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "review_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_comments_on_employee_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "currents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_points", force: :cascade do |t|
    t.string "self_score"
    t.string "month"
    t.integer "employee_id", null: false
    t.integer "manager_id"
    t.float "manager_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_points_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "employee_no"
    t.integer "mobile_number"
    t.integer "reporting_manager_id"
    t.string "designation"
    t.boolean "active", default: true
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "employee_feedback"
    t.string "feedback_type"
    t.integer "employee_id", null: false
    t.boolean "flag", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_feedbacks_on_employee_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "one_on_ones", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.float "feedback_rating"
    t.integer "participant_id"
    t.string "status", default: "ms_pending_approval"
    t.string "repeat_type"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
  end

  create_table "questions", force: :cascade do |t|
    t.text "query"
    t.integer "employee_id", null: false
    t.boolean "clarified"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymous"
    t.integer "manager_id"
    t.index ["employee_id"], name: "index_questions_on_employee_id"
  end

  create_table "reference_data", force: :cascade do |t|
    t.string "data_type"
    t.string "key"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "one_on_one_id", null: false
    t.string "review_type"
    t.string "manager_review"
    t.boolean "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["one_on_one_id"], name: "index_reviews_on_one_on_one_id"
  end

  create_table "user_logins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "email"
    t.string "mobile_number"
    t.string "mobile_auth_code"
    t.string "email_auth_code"
    t.string "login_token"
    t.datetime "mobile_auth_code_sent_at"
    t.datetime "email_auth_code_sent_at"
    t.datetime "mobile_auth_code_verified_at"
    t.datetime "email_auth_code_verified_at"
    t.string "device_name"
    t.string "device_type"
    t.string "mobile_type"
    t.bigint "token_id"
    t.datetime "last_logged_in"
    t.datetime "last_token_refreshed"
    t.string "requester_ip"
    t.string "uid"
    t.string "device_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token_id"], name: "index_user_logins_on_token_id"
    t.index ["uid"], name: "index_user_logins_on_uid"
    t.index ["user_id"], name: "index_user_logins_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.string "mobile_number"
    t.boolean "is_admin", default: false
    t.boolean "active", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "answers", "employees"
  add_foreign_key "answers", "questions"
  add_foreign_key "comments", "employees"
  add_foreign_key "comments", "reviews"
  add_foreign_key "employee_points", "employees"
  add_foreign_key "feedbacks", "employees"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "questions", "employees"
  add_foreign_key "reviews", "one_on_ones"
  add_foreign_key "user_logins", "users"
  add_foreign_key "users", "employees"
end
