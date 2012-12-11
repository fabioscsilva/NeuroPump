class ClinicalHistory < ActiveRecord::Base
  belongs_to :patient

  attr_accessible :description
  validates_presence_of :description
end
