# spec/models/payment.rb
require 'spec_helper'

describe Payment do
  it "has a valid factory" do
    FactoryGirl.create(:payment).should be_valid
  end
  it "is invalid without a creation_date" do
    FactoryGirl.build(:payment, creation_date: nil).should_not be_valid
  end
  it "is invalid without a :due_date" do
    FactoryGirl.build(:payment, due_date: nil).should_not be_valid
  end
  it "is invalid without a :reference" do
    FactoryGirl.build(:payment, reference: nil).should_not be_valid
  end
  it "is invalid without a :value" do
    FactoryGirl.build(:payment, value: nil).should_not be_valid
  end
   it "is valid without a payed" do
    FactoryGirl.build(:payment, payed: nil).should be_valid
  end
   it "is valid without a payment_date" do
    FactoryGirl.build(:payment, payment_date: nil).should be_valid
  end
end