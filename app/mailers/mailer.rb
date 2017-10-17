class Mailer < ActionMailer::Base
  default from: 'report@dorm.tsot.edu'

  def report options
    @out = options[:out]
    @not_logged = options[:not_logged]
    @reports = options[:reports]
    mail :to => 'lesches01@gmail.com, kervelten@gmail.com, info@chcycles.com, rndeitsch@oholeitorah.com', :subject => "Dorm Report - #{Time.zone.now.strftime("%B %-d")}"
  end

end
