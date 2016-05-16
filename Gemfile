source 'https://rubygems.org'
ruby '2.3.1'

gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '~>4.1.0'
gem 'govuk_template',         '~> 0.17.0'
gem 'govuk_frontend_toolkit', '>= 4.6.1'
gem 'govuk_elements_rails',   '>= 1.1.2'
gem 'govuk_elements_form_builder', git: 'git@github.com:ministryofjustice/govuk_elements_form_builder.git'
gem 'haml-rails', '~> 0.9.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'susy', '~> 2.2', '>= 2.2.12'

# Use sqlserver as the database for Active Record
gem 'activerecord-sqlserver-adapter', '4.2.11'
gem 'tiny_tds'
gem 'turbolinks'

gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'guard-livereload', '>= 2.5.2'
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 3.0'
  gem 'thin'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker', '~> 1.6'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers',           '~> 3.1.1', require: false
end