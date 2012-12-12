class Login < ActiveRecord::Base
  belongs_to :type
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients
  has_many :administrators
  belongs_to :type

  attr_accessible :email, :password
end
