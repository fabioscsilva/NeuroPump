class Package < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :packages_clinics
  attr_accessible :n_exercises, :n_evaluations, :n_appointments, :price
  validates_presence_of :price
end
