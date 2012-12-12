class Patient < ActiveRecord::Base
  belongs_to :gender
  belongs_to :clinic
  belongs_to :civil_status
  belongs_to :handedness
  belongs_to :login
  has_many :sessions
  has_many :clinical_histories
  has_attached_file :photo, :default_url => "/assets/noimage.jpg"

  attr_accessible :active, :address, :date_of_birth, :identification_code, :mobilephone, 
                  :name, :photo, :telephone, :education, :profession, :email, :palavrapass, :gender_id, :clinic_id, :civil_status_id, :handedness_id, :login_id
  attr_accessor :email, :palavrapass

  validates_presence_of  :active, :address, :email,:date_of_birth, :identification_code, :name
  validates :email,
             :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "formato incorreto" }

  scope :is_active, where(:active => true)
  scope :in_clinic, lambda { |clinic_id| 
    where(:clinic_id => clinic_id)
  }  

end
