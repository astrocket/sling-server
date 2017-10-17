if Rails.env == 'production'
  Iamport.configure do |config|
    config.api_key = ENV['SLING_IAMPORT_API_KEY']
    config.api_secret = ENV['SLING_IAMPORT_API_SECRET']
  end
else
  Iamport.configure do |config|
    config.api_key = ENV['SLING_IAMPORT_API_KEY']
    config.api_secret = ENV['SLING_IAMPORT_API_SECRET']
  end
end
