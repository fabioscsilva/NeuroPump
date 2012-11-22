class Patient < ActiveRecord::Base
  belongs_to :genders
  belongs_to :clinics
  belongs_to :civil_statuses
  belongs_to :handednesses
  has_many :sessions
  has_many :clinical_histories

  attr_accessible :active, :address, :date_of_birth, :email, :identification_code, :mobilephone, :name, :password, :photo, :telephone
end
