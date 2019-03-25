source 'https://rubygems.org'

ruby "2.6.1"

gem 'activeadmin', '~> 1.4', '>= 1.4.3'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'cancancan', '~> 2.3'
gem 'coffee-rails', '~> 4.2.2'
gem 'delayed_job_active_record', '~> 4.1'
gem 'devise', '~> 4.5'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'pg', '~> 0.18.4'
gem 'rails', '~> 4.2', '>= 4.2.11.1'
gem 'sass-rails', '~> 5.0.7'
gem 'therubyracer', platforms: :ruby
gem 'thin', '~> 1.6', '>= 1.6.4'
gem 'turbolinks'
gem 'uglifier', '~> 2.7.1'

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

group :development do
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'brakeman', '~> 3.1', '>= 3.1.2', :require => false
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'pry'
end

group :test do
  gem "timecop", "~> 0.8.0"
  gem 'capybara', '~> 2.6', '>= 2.6.2'
  gem "database_cleaner"
  gem 'shoulda', '~> 3.5'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
