class Clinic < ActiveRecord::Base
  belongs_to :administrator
  has_many :payments
  has_many :managers
  has_many :neuropsychologists
  has_many :secretaries
  has_many :patients


  attr_accessible :active, :address, :email, :fiscal_number, :name, :telephone, :administrator_id
  
  validates_presence_of :active, :address, :email, :fiscal_number, :name
  validates  :email,
             :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "formato incorreto" }
end
