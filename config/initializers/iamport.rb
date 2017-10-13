if Rails.env == 'production'
  Iamport.configure do |config|
    config.api_key = ENV['SLING_IAMPORT_API_KEY']
    config.api_secret = ENV['SLING_IAMPORT_API_SECRET']
  end
else
  Iamport.configure do |config|
    config.api_key = ENV['ASTRO_IAMPORT_KEY']
    config.api_secret = ENV['ASTRO_IAMPORT_SECRET']
  end
end
