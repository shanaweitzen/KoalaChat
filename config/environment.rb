# Load the Rails application.
require File.expand_path('../application', __FILE__)



KoalaChat::Application.configure do 
  config.action_mailer.default_url_options   = { protocol: ENV['PROTOCOL'] }
  config.action_mailer.default_url_options   = { host: ENV['HOST'] }
  config.action_mailer.default_options       = { from: ENV['EMAIL_DEFAULT'] }
  config.action_mailer.perform_deliveries    = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method       = :smtp
  config.action_mailer.smtp_settings = {
      address:              ENV['EMAIL_ADDRESS'],
      port:                 ENV['EMAIL_PORT'],
      domain:               ENV['EMAIL_DOMAIN'],
      user_name:            ENV["MANDRILL_USERNAME"],
      password:             ENV["MANDRILL_APIKEY"],
      authentication:       'plain',
      enable_starttls_auto: true
  }
end


# Initialize the Rails application.
KoalaChat::Application.initialize!
