source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'pg_search'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'devise'
gem 'devise_token_auth'
gem 'devise_invitable'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
# Get twitter/facebook information
gem 'twitter'
gem 'fb_graph2'

# Attachment
gem 'delayed_paperclip'
gem 'paperclip'
gem 'aws-sdk'

# Views engine
gem 'haml-rails'

# Pagination
# gem 'kaminari'

# Background running
gem 'sidekiq'
gem 'sidekiq-cron', '~> 0.4.5'

# Server config
gem 'dotenv-rails'

# Payment
gem 'braintree'

# Simple form
gem 'simple_form'
gem 'nested_form'

# Push notification
gem 'pushmeup'

# Websocket
gem 'redis', '~> 3.0'

# Cross Origin Allow
gem 'rack-cors', :require => 'rack/cors'

# PDF generate
gem 'wicked_pdf'

# Reading spreadsheet
gem 'simple-spreadsheet'

# Export spreadsheet
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'

gem 'httparty'

group :development, :test do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'ffaker'
  gem 'byebug'
end

group :test do
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
