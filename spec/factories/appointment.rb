# spec/factories/appointment.rb
FactoryGirl.define do
  factory :appointment do |f|
    f.description  { Faker::Lorem }
    f.appointment_day  { "12-12-2012 09:00:00" }
    f.patient_id { 1 }
    f.secretary_id { 1 }
    f.neuropsychologist_id { 1 }
    f.appointment_status_id { 1 }
    f.appointment_type_id { 1 }
    f.duration { 60 }
  end
end