class Clinic < ActiveRecord::Base
  belongs_to :administrator
  has_many :payments
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients
  has_many :logins

  attr_accessible :address, :email, :name, :fiscal_number, :name, :telephone, :administrator_id, :mobilephone
  attr_accessor :mobilephone
  
  validates_presence_of :address, :email, :fiscal_number, :name
  validates  :email,
             :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "formato incorreto" }
end
