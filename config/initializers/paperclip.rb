if Rails.env == 'production'
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_protocol] = :https
  Paperclip::Attachment.default_options[:s3_region] = 'ap-northeast-2'
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-ap-northeast-2.amazonaws.com'
  Paperclip::Attachment.default_options[:s3_credentials] = {
      :bucket => 'slingfamily',
      :access_key_id => ENV['SLING_ACCESS_KEY'],
      :secret_access_key => ENV['SLING_SECRET_KEY']
  }
else
=begin
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_protocol] = :https
  Paperclip::Attachment.default_options[:s3_region] = 'ap-northeast-2'
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-ap-northeast-2.amazonaws.com'
  Paperclip::Attachment.default_options[:s3_credentials] = {
      :bucket => 'astrobox',
      :access_key_id => ENV['VIET_ACCESS_KEY'],
      :secret_access_key => ENV['VIET_SECRET_KEY']
  }
=end
  Paperclip::Attachment.default_options.merge!(
      {
          url: "http://192.168.0.4:3000/system/:class/:id/:attachment/:style/:filename",
      }
  )
end
