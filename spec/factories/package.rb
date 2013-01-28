# spec/factories/package.rb
FactoryGirl.define do
  factory :package do |f|
    f.n_exercises  { 12 }
    f.n_evaluations { 12 }
    f.n_appointments { 12 }
    f.price { 12.02 }
    f.name { Faker::Name.name }
  end
end

 