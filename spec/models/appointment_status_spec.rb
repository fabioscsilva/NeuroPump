# spec/models/appointment_status.rb
require 'spec_helper'

describe AppointmentStatus do
  it "has a valid factory" do
    FactoryGirl.create(:appointment_status).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:appointment_status, name: nil).should_not be_valid
  end
end