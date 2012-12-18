class Test < ActiveRecord::Base
  belongs_to :test_area
  has_many :appointment_plans
  attr_accessible :name, :description, :test_area_id
end
