Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],
    image_size: :original, secure_image_url: true

  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    scope: 'email,public_profile', display: 'popup',
    image_size: :large, secure_image_url: true, info_fields: 'email,name'
end
