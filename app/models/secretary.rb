class Secretary < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :gender
  belongs_to :login
  has_many :appointments
  has_attached_file :photo, :default_url => "/assets/noimage.jpg"

  attr_accessible :address, :date_of_birth, :identification_code, :mobilephone, :name, :photo,
   :telephone, :login_attributes,:gender_id, :clinic_id, :login_id

  accepts_nested_attributes_for :login
 
  validates_presence_of :address, :date_of_birth, :identification_code, :name
  
   scope :is_active, joins(:login).where("deleted_at IS NULL")
end
