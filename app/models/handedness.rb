class Handedness < ActiveRecord::Base
  has_many :patients

  attr_accessible :description 
  
  validates_presence_of :description
end
