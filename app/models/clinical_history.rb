class ClinicalHistory < ActiveRecord::Base
  belongs_to :patients

  attr_accessible :description
end
