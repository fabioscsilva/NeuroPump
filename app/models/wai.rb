class Wai < ActiveRecord::Base
  attr_accessible :correct_items, :observations, :phase, :spent_time, :wrong_items
end
