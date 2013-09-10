class Counselor < ActiveRecord::Base

  # Gems
  has_secure_password

  # Associations
  has_many :rooms
  has_many :reports
  has_many :students, through: :rooms

  # Attributes
  attr_accessible :email, :password, :password_confirmation, :name

  # Validations
  validates :name, presence: true
  validates :email, presence: true, email: true

end
