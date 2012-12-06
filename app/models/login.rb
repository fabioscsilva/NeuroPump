class Login < ActiveRecord::Base
  belongs_to :type
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients


  attr_accessible :email, :password, :type_id
end
