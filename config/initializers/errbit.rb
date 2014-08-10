Airbrake.configure do |config|
  config.api_key = '2f34f47804f57556b2b28a38aed9934d'
  config.host    = 'e.firehawkcreative.com'
  config.port    = 80
  config.secure  = config.port == 443
end