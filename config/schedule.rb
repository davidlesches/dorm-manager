
env :PATH, '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'

every %w(sun mon tue wed thu sat), :at => '11:00 pm' do
  runner "Report.create_for_today"
end

every %w(sun mon tue wed thu fri), :at => '2:00 am' do
  runner "Report.daily_work"
end