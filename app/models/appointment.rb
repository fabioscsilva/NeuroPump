class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :secretary
  belongs_to :neuropsychologist
  belongs_to :appointment_type
  belongs_to :appointment_status
  has_many :appointment_plans

  attr_accessible :description, :appointment_day, :patient_id, :secretary_id, :neuropsychologist_id, :appointment_status_id, :appointment_type_id

  scope :is_active, where(:active => true)
  scope :in_clinic, lambda { |clinic_id| 
    where(:clinic_id => clinic_id)
  }
end
