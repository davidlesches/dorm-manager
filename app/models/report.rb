class Report < ActiveRecord::Base

  # Associations
  belongs_to :counselor
  has_many :attendances, dependent: :destroy

  # Scopes
  scope :yesterday, -> { where('DATE(report_date) = ?', Time.zone.now.yesterday.to_date) }

  # Attributes
  attr_accessible :report_date

  # Class Methods
  def self.for counselor
    date = Time.zone.now.hour == 0 ? Time.zone.now.yesterday.to_date : Time.zone.now.to_date
    counselor.reports.where('DATE(report_date) = ?', date).last
  end

  def self.create_for_today
    Counselor.all.each do |counselor|
      report = counselor.reports.create!(report_date: Time.zone.now.to_date)
      counselor.students.where('exemptions > 0').each do |student|
        report.attendances.create!(student_id: student.id, status: 'Exempt')
        student.update_attributes!(exemptions: student.exemptions - 1)
      end
    end
  end

  def self.daily_work # run this method every morning
    Report.log_absentees
    Report.mail_reports
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

  def self.mail_reports
    out = []
    not_logged = []

    yesterday.each do |report|
      out << report.attendances.out
      not_logged << report.attendances.not_logged
    end

    Mailer.report(out: out.flatten, not_logged: not_logged.flatten, reports: yesterday).deliver
  end

end
