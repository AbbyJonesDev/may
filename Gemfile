source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Paperclip for attaching mp3 audio files and pdf charts
gem "paperclip", "~> 3.0"

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Devise gem for User authentication
gem 'devise'

# Use Twitter Bootstrap for layout and styling
gem 'bootstrap-sass', '~> 3.0.1.0.rc'

# Use Simple Form for creating forms easily
gem 'simple_form'

# Use TinyMCE for rich text editing
gem "tinymce-rails", "~> 4.0.8"

group :development, :test do
  gem 'sqlite3'
  gem  'debugger'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'ZenTest'
end
group :test do
  gem "cucumber-rails", "~> 1.4.0", :require => false
  gem 'simplecov'
  gem  "factory_girl_rails", "~> 4.0"
end

group :production do
 gem 'pg'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development
gem 'capistrano-rails', group: :development
gem 'capistrano-bundler', group: :development


# Use debugger
# gem 'debugger', group: [:development, :test]
