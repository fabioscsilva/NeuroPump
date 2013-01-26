# spec/models/packages_clinic.rb
require 'spec_helper'

describe PackagesClinic do
  it "has a valid factory" do
    FactoryGirl.create(:packages_clinic).should be_valid
  end
  it "is invalid without a week" do
    FactoryGirl.build(:packages_clinic, week: nil).should_not be_valid
  end
  it "is invalid without a start_date" do
    FactoryGirl.build(:packages_clinic, start_date: nil).should_not be_valid
  end
  it "is invalid without a package_id" do
    FactoryGirl.build(:packages_clinic, package_id: nil).should_not be_valid
  end
    it "is invalid without a appointment_token" do
    FactoryGirl.build(:packages_clinic, appointment_token: nil).should_not be_valid
  end
  it "is invalid without a clinic_id" do
    FactoryGirl.build(:packages_clinic, clinic_id: nil).should_not be_valid
  end
end