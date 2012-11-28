class Manager < ActiveRecord::Base
  belongs_to :genders
  belongs_to :clinics
  belongs_to :logins

  attr_accessible :mobilephone, :telephone
end
