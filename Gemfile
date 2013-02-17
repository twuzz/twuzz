source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'sqlite3'
gem 'pg'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'haml'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'ci_reporter'
  gem 'simplecov', :require => false
  gem 'syntax'
end

# Include in development in addition to test for generators.
group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
