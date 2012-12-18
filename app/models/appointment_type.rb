class AppointmentType < ActiveRecord::Base
  has_many :appointments
  attr_accessible :name
  validates_presence_of :name
end
