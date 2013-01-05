class EvaluationTest < ActiveRecord::Base
  belongs_to :test_area
  
  has_many :appointment_plans 
  has_many :appointments, through: :appointment_plans
  
  attr_accessible :name, :description, :test_area_id
end
