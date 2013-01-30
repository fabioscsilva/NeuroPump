class ClockResult < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :number_seq_result, :observations, :pointers_loc_result, :screen_result,:appointment_plan_id
end
