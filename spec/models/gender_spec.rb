# spec/models/gender.rb
require 'spec_helper'

describe Gender do
  it "has a valid factory" do
    FactoryGirl.create(:gender).should be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:gender, description: nil).should_not be_valid
  end
end