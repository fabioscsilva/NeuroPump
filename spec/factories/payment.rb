# spec/factories/payment.rb
FactoryGirl.define do
  factory :payment do |f|
    f.creation_date  { "2013-01-22" }
    f.due_date { "2013-02-03" }
    f.payed { true }
    f.payment_date { "2013-02-02" }
    f.reference { "9874566" }
    f.value { 12.2 }
  end
end

