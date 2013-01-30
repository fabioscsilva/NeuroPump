class FttResult < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :eighth, :fifth, :first, :fourth, :ninth, :observations, :second, :seventh, :sixth, :tenth, :test_phase, :third,:appointment_plan_id
end
