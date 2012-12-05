class Patient < ActiveRecord::Base
  belongs_to :gender
  belongs_to :clinic
  belongs_to :civil_status
  belongs_to :handedness
  belongs_to :login
  has_many :sessions
  has_many :clinical_histories

  attr_accessible :active, :address, :date_of_birth, :identification_code, :mobilephone, :name, :photo, :telephone, :education, :profession, :email, :palavrapass
  attr_accessor :email, :palavrapass
end
