class Attendance < ActiveRecord::Base

  # Associations
  belongs_to :report
  belongs_to :student

  # Scopes
  scope :in, where(status: 'In')
  scope :out, where(status: 'Out')
  scope :not_logged, where(status: 'Not Logged')

  # Attributes
  attr_accessible :status, :student_id

end
