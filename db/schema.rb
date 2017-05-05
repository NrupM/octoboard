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

ActiveRecord::Schema.define(version: 20170505025050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.string "daily_goal"
    t.string "longterm_goal"
    t.string "weekly_goal"
    t.date "longterm_goal_date"
    t.integer "applications_per_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "primary_contact_name"
    t.string "primary_contact_title"
    t.string "primary_contact_email"
    t.string "primary_contact_phone"
    t.integer "interview_type"
    t.text "notes"
    t.datetime "coding_challenge_due_date"
    t.text "coding_challenge_prompt"
    t.string "coding_challenge_url"
    t.text "thankyou_letter"
    t.text "questions_to_ask"
    t.datetime "interview_date"
    t.boolean "is_followup_needed"
    t.boolean "is_challenge_completed"
    t.bigint "job_application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["job_application_id"], name: "index_interviews_on_job_application_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.date "date_applied"
    t.integer "stage"
    t.string "company_name"
    t.string "location"
    t.string "job_post_url"
    t.text "job_description"
    t.text "job_requirements"
    t.string "job_title"
    t.integer "application_method"
    t.text "why_interested"
    t.string "requested_salary"
    t.text "submitted_cover_letter"
    t.text "relevant_work_history"
    t.string "tech_stack"
    t.text "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.text "answer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "goals", "users"
  add_foreign_key "interviews", "job_applications"
  add_foreign_key "interviews", "users"
  add_foreign_key "job_applications", "users"
  add_foreign_key "questions", "users"
end
