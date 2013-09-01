class Mailer < ActionMailer::Base
  default from: 'report@dorm.tsot.edu'

  def report options
    @out = options[:out]
    @not_logged = options[:not_logged]
    mail :to => 'lesches01@gmail.com, ylesches@gmail.com, kervelten@gmail.com', :subject => "Dorm Report - #{Time.zone.now.strftime("%B %-d")}"
  end

end
