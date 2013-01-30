# spec/factories/packages_clinic.rb
FactoryGirl.define do
  factory :packages_clinic do |f|
    f.start_date  { "2013-02-12" }
    f.appointment_token { 1 }
    f.week  { 1 }
    f.package_id  { 1 }
    f.clinic_id  { 1 }
  end
end

