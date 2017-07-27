source 'https://rubygems.org'

gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'geocoder', '~> 1.4.4'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop', '~> 0.48.0', require: false
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.18.4'
end

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'faker', '~> 1.7.3'
  gem 'guard-rspec', require: false
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
