class WmsResult < ActiveRecord::Base
  attr_accessible :correct_items, :observations, :phase, :wrong_items
end
