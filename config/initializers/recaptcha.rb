Recaptcha.configure do |config|
  config.skip_verify_env << Rails.env.test?
end