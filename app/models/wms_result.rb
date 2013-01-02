class WmsResult < ActiveRecord::Base
  belongs_to :appointment_plan

  attr_accessible :correct_items, :observations, :phase, :wrong_items
end
