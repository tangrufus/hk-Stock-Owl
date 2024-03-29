source 'https://rubygems.org'

## Ruby version
### Update .ruby-version as well
ruby "2.1.5"

## Default gems

gem 'rails',                    '4.2.0.rc2'
### rails 4.2.0.rc1 - ActiveAdmin
gem 'inherited_resources',      github: 'codecraft63/inherited_resources'


# Use postgresql as the database for Active Record
# Run `gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config` instead of `bundle install`
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails',               '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                 '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails',             '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                 '~> 2.0'
# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer',     '~> 1.0'
# Use unicorn as the app server
gem 'unicorn',                  '~> 4.8.3'

# hkStockOwl gems

## Debugging
group :development do
  gem 'binding_of_caller',        '~> 0.7.2'
  gem 'better_errors',            '~> 2.0.0'
  gem 'did_you_mean',             '~> 0.9.0'
  gem 'annotate',                 '~> 2.6.5'
  gem 'rubocop',                  '~> 0.27.1',  require: false
  gem 'brakeman',                 '~> 2.6.3',   require: false
  ### run `gem install mailcatcher` yourself
  ### see http://mailcatcher.me/#bundler
end

## Production
group :production do
  gem 'rails_12factor',           '~> 0.0.3'
end

## All envirments
# For worker management
gem 'foreman',                  '~> 0.76.0'
# Membership
gem 'devise',                   github: 'plataformatec/devise'
# CMS
gem 'activeadmin',              github: 'gregbell/active_admin'
# Theme
gem 'bootstrap-sass',           '~> 3.3.1.0'
gem 'autoprefixer-rails',       '~> 4.0.1'
gem 'font-awesome-sass',        '~> 4.2.2'
# Form generation
gem 'simple_form',              '~> 3.1.0'
# For modeling
gem 'auto_strip_attributes',    '~> 2.0.6'
# Scraping HTML
gem 'nokogiri',                 '~> 1.6.4'
# Background Job
gem 'resque',                   '~> 1.25.2',  :require => 'resque/server'
# URL Shortener
gem 'bitly',                    '~> 0.10.3'
# Performance monitor
gem 'newrelic_rpm',             '~> 3.9.8.273'
