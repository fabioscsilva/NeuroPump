# spec/models/appointment_type.rb
require 'spec_helper'

describe AppointmentType do
  it "has a valid factory" do
    FactoryGirl.create(:appointment_type).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:appointment_type, name: nil).should_not be_valid
  end
end