source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.5'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt'

gem 'devise'
gem 'devise-i18n'
gem 'cancancan'
gem 'rolify'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

gem 'pg', '0.15.1'
gem 'unicorn'
gem 'aasm', git: 'https://github.com/aasm/aasm.git'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'newrelic_rpm'
end