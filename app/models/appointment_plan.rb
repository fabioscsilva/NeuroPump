class AppointmentPlan < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :evaluation_test

  has_many :clocks
  has_many :ftts
  has_many :tmts
  has_many :wais
  has_many :wms
end
