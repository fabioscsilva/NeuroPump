class ClinicalHistory < ActiveRecord::Base
  belongs_to :patient

  attr_accessible :description
end
