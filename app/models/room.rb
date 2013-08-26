class Room < ActiveRecord::Base

  # Associations
  belongs_to :counselor
  has_many :students

  # Attributes
  attr_accessible :name, :counselor_id

  # Validations
  validates :name, presence: true

end
