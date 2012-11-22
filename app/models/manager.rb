class Manager < ActiveRecord::Base
  belongs_to :genders
  belongs_to :clinics

  attr_accessible :email, :mobilephone, :password, :telephone
end
