class Administrator < ActiveRecord::Base

  # Gems
  has_secure_password

  # Attributes
  attr_accessible :email, :password, :password_confirmation

  # Validations
  validates :email, presence: true, email: true

end
