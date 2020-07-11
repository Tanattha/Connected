
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true
end

OmniAuth.config.full_host = Rails.env.production? ? 'https://rails-connected.herokuapp.com' : 'http://localhost:3000'