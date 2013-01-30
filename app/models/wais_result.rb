class WaisResult < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :correct_items, :observations, :phase, :spent_time, :wrong_items,:appointment_plan_id
end
