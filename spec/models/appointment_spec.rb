# spec/models/appointment.rb
require 'spec_helper'

describe Appointment do
  it "has a valid factory" do
    FactoryGirl.create(:appointment).should be_valid
  end
  it "is invalid without a description" do
    #FactoryGirl.build(:appointment, description: nil).should_not be_valid
  end
  it "is invalid without a appointment_day" do
    #FactoryGirl.build(:appointment, appointment_day: nil).should_not be_valid
  end
  it "is invalid without a patient_id"

  it "is invalid without a secretary_id" 
  
  it "is invalid without a neuropsychologist_id" 

  it "is invalid without a appointment_status_id" 

  it "is invalid without a appointment_type_id" 

  it "is invalid without a duration" 

end