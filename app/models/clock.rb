class Clock < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :number_seq_result, :observations, :pointers_loc_result, :screen_result
end
