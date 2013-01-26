# spec/factories/appointment_type.rb
FactoryGirl.define do
  factory :appointment_type do |f|
    f.name  { Faker::Name.first_name }
  end
end