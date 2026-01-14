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

ActiveRecord::Schema[8.1].define(version: 2026_01_13_135144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_admissions_on_student_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "academic_year"
    t.datetime "created_at", null: false
    t.bigint "level_id", null: false
    t.string "status"
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.string "term"
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_assessments_on_level_id"
    t.index ["student_id"], name: "index_assessments_on_student_id"
    t.index ["subject_id"], name: "index_assessments_on_subject_id"
  end

  create_table "class_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "level_id", null: false
    t.string "stream"
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_class_rooms_on_level_id"
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "level_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_courses_on_level_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "grade_subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "level_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_grade_subjects_on_level_id"
    t.index ["subject_id"], name: "index_grade_subjects_on_subject_id"
  end

  create_table "levels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "order"
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "admission_number"
    t.bigint "class_room_id"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "first_name"
    t.string "gender"
    t.string "last_name"
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_students_on_class_room_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "category"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "teaching_assignments", force: :cascade do |t|
    t.bigint "class_room_id", null: false
    t.datetime "created_at", null: false
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_teaching_assignments_on_class_room_id"
    t.index ["subject_id"], name: "index_teaching_assignments_on_subject_id"
    t.index ["teacher_id"], name: "index_teaching_assignments_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admissions", "students"
  add_foreign_key "assessments", "levels"
  add_foreign_key "assessments", "students"
  add_foreign_key "assessments", "subjects"
  add_foreign_key "class_rooms", "levels"
  add_foreign_key "courses", "levels"
  add_foreign_key "courses", "subjects"
  add_foreign_key "grade_subjects", "levels"
  add_foreign_key "grade_subjects", "subjects"
  add_foreign_key "students", "class_rooms"
  add_foreign_key "teaching_assignments", "class_rooms"
  add_foreign_key "teaching_assignments", "subjects"
  add_foreign_key "teaching_assignments", "teachers"
end
