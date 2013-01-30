class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :secretary
  belongs_to :neuropsychologist
  belongs_to :appointment_type
  belongs_to :appointment_status
  
  has_many :appointment_plans
  has_many :evaluation_tests, through: :appointment_plans

  attr_accessible :description, :appointment_day, :patient_id, :secretary_id, :neuropsychologist_id, :appointment_status_id, :appointment_type_id, :duration

  scope :is_active, joins(:login).where("deleted_at IS NULL")
  scope :in_clinic, lambda { |clinic_id| 
    where(:clinic_id => clinic_id)
  }
end
