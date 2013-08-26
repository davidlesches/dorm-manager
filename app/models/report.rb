class Report < ActiveRecord::Base

  # Associations
  belongs_to :counselor
  has_many :attendances, dependent: :destroy

  # Scopes
  scope :yesterday, -> { where('DATE(report_date) = ?', Time.zone.now.yesterday.to_date) }

  # Attributes
  attr_accessible :report_date

  # Class Methods
  def self.create_for_today
    Counselor.all.each { |c| c.reports.create!(report_date: Time.zone.now.to_date) }
  end

  def self.for counselor
    date = Time.zone.now.hour == 0 ? Time.zone.now.yesterday.to_date : Time.zone.now.to_date
    counselor.reports.where('DATE(report_date) = ?', date).last
  end

  def self.log_absentees
    yesterday.each do |report|
      logged = report.attendances.pluck(:student_id)
      absent = report.counselor.students.pluck(:id) - logged
      absent.each do |student_id|
        report.attendances.create!(student_id: student_id, status: 'Not Logged')
      end
    end
  end

  def self.send_out
    where('DATE(report_date) = ?', Time.zone.now.yesterday.to_date).each do |report|
      # TODO Create NIL attendances for ppl without a record.
    end
    # TODO send out mailer
  end

end
