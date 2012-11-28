class Login < ActiveRecord::Base
  belongs_to :types
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients


  attr_accessible :email, :password
end
