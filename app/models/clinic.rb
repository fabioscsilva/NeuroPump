class Clinic < ActiveRecord::Base
  belongs_to :administrators
  has_many :payments
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients

  attr_accessible :active, :address, :email, :fiscal_number, :name, :telephone
end
