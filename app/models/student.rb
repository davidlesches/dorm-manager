class Student < ActiveRecord::Base

  # Associations
  belongs_to :room
  has_many :attendances, dependent: :destroy

  # Attributes
  attr_accessible :name, :room_id, :exemptions

  # Validations
  validates :name, presence: true

end
