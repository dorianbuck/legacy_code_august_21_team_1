source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'clarifai-rails', '~> 0.2.1'
gem 'monkeylearn'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.0.0'
gem 'rest-client'
gem 'solargraph'

group :development, :test do
  gem 'simplecov', require: false, group: :test
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'webmock'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
