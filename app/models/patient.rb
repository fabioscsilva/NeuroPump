class Patient < ActiveRecord::Base
  belongs_to :gender
  belongs_to :clinic
  belongs_to :civil_status
  belongs_to :handedness
  belongs_to :login
  has_many :appointments
  has_many :clinical_histories
  has_attached_file :photo, :default_url => "/assets/noimage.jpg"

  attr_accessible :address, :date_of_birth, :identification_code, :mobilephone, 
                  :name, :photo, :telephone, :education, :profession, :email, :palavrapass, :gender_id, :clinic_id, :civil_status_id, :handedness_id, :login_id
  attr_accessor :email, :palavrapass

  accepts_nested_attributes_for :login

  validates_presence_of  :address,:date_of_birth, :identification_code, :name

  scope :is_active, joins(:login).where("deleted_at IS NULL")
  scope :in_clinic, lambda { |clinic_id| 
    where(:clinic_id => clinic_id)
  }  

end
