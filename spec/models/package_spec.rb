# spec/models/package.rb
require 'spec_helper'

describe Package do
  it "has a valid factory" do
    FactoryGirl.create(:package).should be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:package, price: nil).should_not be_valid
  end
end