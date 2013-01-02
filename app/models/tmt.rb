class Tmt < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :observations, :phase, :time
end
