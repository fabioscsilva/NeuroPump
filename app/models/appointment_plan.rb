class AppointmentPlan < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :test
end
