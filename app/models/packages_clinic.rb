class PackagesClinic < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :package 
  belongs_to :clinic
  attr_accessible :appointment_token, :start_date, :week
  validates_presence_of :week, :start_date, :appointment_token
end
