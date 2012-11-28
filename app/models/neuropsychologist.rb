class Neuropsychologist < ActiveRecord::Base
  belongs_to :clinics
  belongs_to :genders
  belongs_to :logins
  has_many :sessions
  
  attr_accessible :active, :address, :date_of_birth, :identification_code, :mobilephone, :name, :photo, :telephone
end
