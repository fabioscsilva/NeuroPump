class PackagesClinic < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :package 
  belongs_to :clinic
  attr_accessible :appointment_token, :start_date, :week, :package_id, :clinic_id
  validates_presence_of :week, :start_date, :appointment_token, :package_id, :clinic_id
end
