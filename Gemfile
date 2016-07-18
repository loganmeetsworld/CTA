source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'pg' # instead of sqlite
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-ui-rails'

# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'gon'

# Batching db instances
gem 'activerecord-import', '~> 0.11.0'

gem 'leaflet-rails'

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec', '~> 3.0'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
end

group :development do
  gem 'web-console'
  gem 'pry'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
