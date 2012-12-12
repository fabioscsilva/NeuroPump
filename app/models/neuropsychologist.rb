class Neuropsychologist < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :gender
  belongs_to :login
  has_many :appointments
  has_attached_file :photo, :default_url => "/assets/noimage.jpg"
  
  attr_accessible :active, :address, :date_of_birth, :identification_code, :mobilephone, :name, :photo, :telephone, :login_attributes, :gender_id, :clinic_id, :login_id
  
  accepts_nested_attributes_for :login
  
  validates_presence_of :active, :address, :date_of_birth, :identification_code, :name
  
  scope :is_active, where(:active => true)

end
