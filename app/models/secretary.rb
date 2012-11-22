class Secretary < ActiveRecord::Base
  belongs_to :clinics
  belongs_to :genders
  has_many :sessions

  attr_accessible :active, :address, :date_of_birth, :email, :identification_code, :mobilephone, :name, :password, :photo, :telephone
end
