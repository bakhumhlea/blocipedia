source 'https://rubygems.org'
 
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

# #1
group :production do
  # Use pg as the production database for Active Record
  gem 'pg'
  gem 'rails_12factor'
end

# #2
group :development do
  # Use sqlite3 as the development database for Active Record
  gem 'sqlite3'
end

# Use Puma as the app server (Rail5)
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder (Rail5)
gem 'jbuilder', '~> 2.5'
# thor (Rail5)
gem 'thor', '0.19.1'
# use devise for authentication
gem 'devise'
# use pry-rails as rails console
gem 'pry-rails'
# to use 'has_secure_password'
gem 'bcrypt'
# use figaro to store important data
gem 'figaro', '1.0'
# bootstrap gem
gem 'bootstrap-sass'

gem "factory_bot_rails", "~> 4.0"

gem 'pundit'

gem 'faker'

gem 'stripe'

gem 'redcarpet'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'letter_opener'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
end