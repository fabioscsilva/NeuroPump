class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :secretary
  belongs_to :neuropsychologist

  attr_accessible :description, :appointment_date, :patient_id, :secretary_id, :neuropsychologist_id
end
