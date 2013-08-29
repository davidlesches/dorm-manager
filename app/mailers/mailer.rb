class Mailer < ActionMailer::Base
  default from: 'noreply@dorm-manager.com'

  def report options
    @out = options[:out]
    @not_logged = options[:not_logged]
    mail :to => 'lesches01@gmail.com, ylesches@gmail.com', :subject => "Dorm Report - #{Time.zone.now.strftime("%B %-d")}"
  end

end
