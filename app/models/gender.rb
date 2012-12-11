class Gender < ActiveRecord::Base
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients

  attr_accessible :description
  
  validates_presence_of :description
  

end
