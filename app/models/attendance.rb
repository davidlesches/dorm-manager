class Attendance < ActiveRecord::Base

  # Associations
  belongs_to :report
  belongs_to :student

  # Attributes
  attr_accessible :status, :student_id

end
