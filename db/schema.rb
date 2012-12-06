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

ActiveRecord::Schema.define(:version => 20121206133228) do

  create_table "administrators", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "password",    :null => false
    t.string   "address",     :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.string   "email",       :null => false
    t.boolean  "active",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "civil_statuses", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clinical_histories", :force => true do |t|
    t.string   "description", :null => false
    t.integer  "patient_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clinics", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "address",                             :null => false
    t.string   "fiscal_number",                       :null => false
    t.string   "email",                               :null => false
    t.string   "telephone"
    t.boolean  "active",           :default => false
    t.integer  "administrator_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
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
    t.integer  "type_id"
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
  end

  add_index "logins", ["email"], :name => "index_logins_on_email", :unique => true
  add_index "logins", ["reset_password_token"], :name => "index_logins_on_reset_password_token", :unique => true

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
    t.string   "name",                                  :null => false
    t.string   "address",                               :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.date     "date_of_birth",                         :null => false
    t.string   "identification_code",                   :null => false
    t.boolean  "active",              :default => true
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "login_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "address",                               :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.date     "date_of_birth",                         :null => false
    t.string   "identification_code",                   :null => false
    t.boolean  "active",              :default => true
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "civil_status_id"
    t.integer  "handedness_id"
    t.integer  "login_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "education"
    t.string   "profession"
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

  create_table "secretaries", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "address",                               :null => false
    t.string   "telephone"
    t.string   "mobilephone"
    t.date     "date_of_birth",                         :null => false
    t.string   "identification_code",                   :null => false
    t.boolean  "active",              :default => true
    t.integer  "gender_id"
    t.integer  "clinic_id"
    t.integer  "login_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.date     "session_day",          :null => false
    t.text     "description"
    t.integer  "patient_id"
    t.integer  "secretary_id"
    t.integer  "neuropsychologist_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
