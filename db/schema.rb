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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130108155741) do

  create_table "administrators", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "address",     :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.integer  "login_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "appointment_plans", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "evaluation_test_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "appointment_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "appointment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "appointments", :force => true do |t|
    t.datetime "appointment_day",                       :null => false
    t.text     "description"
    t.integer  "patient_id"
    t.integer  "secretary_id"
    t.integer  "neuropsychologist_id"
    t.integer  "appointment_type_id"
    t.integer  "appointment_status_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "duration",              :default => 60
  end

  create_table "civil_statuses", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clinical_histories", :force => true do |t|
    t.text     "description", :null => false
    t.integer  "patient_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clinics", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "address",          :null => false
    t.string   "fiscal_number",    :null => false
    t.string   "email",            :null => false
    t.string   "telephone"
    t.integer  "administrator_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "deleted_at"
  end

  create_table "clock_results", :force => true do |t|
    t.integer  "screen_result"
    t.integer  "number_seq_result"
    t.float    "pointers_loc_result"
    t.text     "observations"
    t.integer  "appointment_plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "evaluation_tests", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "test_area_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "ftt_results", :force => true do |t|
    t.integer  "test_phase"
    t.integer  "first"
    t.integer  "second"
    t.integer  "third"
    t.integer  "fourth"
    t.integer  "fifth"
    t.integer  "sixth"
    t.integer  "seventh"
    t.integer  "eighth"
    t.integer  "ninth"
    t.integer  "tenth"
    t.text     "observations"
    t.integer  "appointment_plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "handednesses", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "logins", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "encrypted_password",                    :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "deleted_at"
    t.integer  "clinic_id"
  end

  add_index "logins", ["reset_password_token"], :name => "index_logins_on_reset_password_token", :unique => true

  create_table "logins_roles", :id => false, :force => true do |t|
    t.integer "login_id"
    t.integer "role_id"
  end

  add_index "logins_roles", ["login_id", "role_id"], :name => "index_logins_roles_on_login_id_and_role_id"

  create_table "managers", :force => true do |t|
    t.string   "telephone"
    t.string   "mobilephone"
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "login_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "neuropsychologists", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "address",             :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.date     "date_of_birth",       :null => false
    t.string   "identification_code", :null => false
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "login_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "packages", :force => true do |t|
    t.integer  "n_exercises"
    t.integer  "n_evaluations"
    t.integer  "n_appointments"
    t.decimal  "price",          :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "packages_clinics", :force => true do |t|
    t.integer  "appointment_token", :null => false
    t.datetime "start_date",        :null => false
    t.integer  "week",              :null => false
    t.integer  "package_id"
    t.integer  "clinic_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "address",             :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.string   "education"
    t.string   "profession"
    t.date     "date_of_birth",       :null => false
    t.string   "identification_code", :null => false
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "civil_status_id"
    t.integer  "handedness_id"
    t.integer  "login_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "payments", :force => true do |t|
    t.datetime "payment_date"
    t.datetime "due_date",                         :null => false
    t.datetime "creation_date",                    :null => false
    t.string   "reference",                        :null => false
    t.decimal  "value",                            :null => false
    t.boolean  "payed",         :default => false
    t.integer  "clinic_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "secretaries", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "address",             :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.date     "date_of_birth",       :null => false
    t.string   "identification_code", :null => false
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "login_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "test_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tmt_results", :force => true do |t|
    t.integer  "phase"
    t.time     "time"
    t.text     "observations"
    t.integer  "appointment_plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "wais_results", :force => true do |t|
    t.integer  "phase"
    t.time     "spent_time"
    t.integer  "correct_items"
    t.integer  "wrong_items"
    t.text     "observations"
    t.integer  "appointment_plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "wms_results", :force => true do |t|
    t.integer  "phase"
    t.integer  "correct_items"
    t.integer  "wrong_items"
    t.text     "observations"
    t.integer  "appointment_plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
