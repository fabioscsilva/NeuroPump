# spec/factories/test_area.rb
FactoryGirl.define do
  factory :test_area do |f|
    f.name  { Faker::Name.name }
  end
end