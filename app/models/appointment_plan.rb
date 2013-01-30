class AppointmentPlan < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :evaluation_test

  has_many :clocks
  has_many :ftts
  has_many :tmts
  has_many :wais
  has_many :wms
  
  attr_accessible :appointment_id, :evaluation_test_id
  
  validates_presence_of :appointment_id, :evaluation_test_id
  
end
