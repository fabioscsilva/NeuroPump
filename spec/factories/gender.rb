# spec/factories/gender.rb
FactoryGirl.define do
  factory :gender do |f|
    f.description  { Faker::Name.first_name }
  end
end