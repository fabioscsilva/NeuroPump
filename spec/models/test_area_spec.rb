# spec/models/test_area.rb
require 'spec_helper'

describe TestArea do
  it "has a valid factory" do
    FactoryGirl.create(:test_area).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:test_area, name: nil).should_not be_valid
  end
end