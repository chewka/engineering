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

ActiveRecord::Schema[8.0].define(version: 2025_07_10_000011) do
  create_table "formative_assignment_completions", force: :cascade do |t|
    t.integer "formative_assignment_id", null: false
    t.integer "user_id", null: false
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formative_assignment_id"], name: "idx_facomps_on_fa_id"
    t.index ["user_id"], name: "index_formative_assignment_completions_on_user_id"
  end

  create_table "formative_assignments", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.string "name"
    t.text "content"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_formative_assignments_on_lesson_id"
  end

  create_table "lesson_standards", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.string "standard_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_standards_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "quarter_id", null: false
    t.string "name"
    t.integer "lesson_number"
    t.text "essential_question"
    t.text "learning_intention"
    t.text "content"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quarter_id"], name: "index_lessons_on_quarter_id"
  end

  create_table "quarters", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "quarter_number", null: false
    t.integer "semester_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_grades", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "user_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_grades_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_grades_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_quizzes_on_lesson_id"
  end

  create_table "standards", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "description"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summative_assignment_completions", force: :cascade do |t|
    t.integer "summative_assignment_id", null: false
    t.integer "user_id", null: false
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["summative_assignment_id"], name: "idx_sacoms_on_sa_id"
    t.index ["user_id"], name: "index_summative_assignment_completions_on_user_id"
  end

  create_table "summative_assignments", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.string "name"
    t.text "content"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_summative_assignments_on_lesson_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "student_id", null: false
    t.string "name"
    t.integer "year", default: 1, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_users_on_student_id", unique: true
  end

  add_foreign_key "formative_assignment_completions", "formative_assignments"
  add_foreign_key "formative_assignment_completions", "users"
  add_foreign_key "formative_assignments", "lessons"
  add_foreign_key "lesson_standards", "lessons"
  add_foreign_key "lesson_standards", "standards", column: "standard_code", primary_key: "code"
  add_foreign_key "lessons", "quarters"
  add_foreign_key "quiz_grades", "quizzes"
  add_foreign_key "quiz_grades", "users"
  add_foreign_key "quizzes", "lessons"
  add_foreign_key "summative_assignment_completions", "summative_assignments"
  add_foreign_key "summative_assignment_completions", "users"
  add_foreign_key "summative_assignments", "lessons"
end
