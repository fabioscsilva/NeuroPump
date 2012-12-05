class Secretary < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :gender
  belongs_to :login
  has_many :sessions
  has_attached_file :photo

  attr_accessible :active, :address, :date_of_birth, :identification_code, :mobilephone, :name, :photo, :telephone
end
