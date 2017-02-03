source 'https://rubygems.org'
ruby '2.3.1'

gem 'aws-sdk', '< 2.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '~>4.1.0'
gem 'govuk_template',         '~> 0.17.2'
gem 'govuk_frontend_toolkit', '>= 4.12.0'
gem 'govuk_elements_rails',   '>= 1.2.0'
gem 'govuk_elements_form_builder', git: 'https://github.com/ministryofjustice/govuk_elements_form_builder.git'
gem 'gov_uk_date_fields', '>= 1.0.7'

gem 'haml-rails', '~> 0.9.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'paperclip', '4.3.6'
gem 'pg'
gem 'rails', '4.2.7.1'
gem 'puma', '~> 3.4'
gem 'sass-rails', '~> 5.0'
gem 'susy', '~> 2.2', '>= 2.2.12'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rb-readline'
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker', '~> 1.6'
  gem 'guard-livereload', '>= 2.5.2'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rspec-rails', '~> 3.0'
  gem 'launchy'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'shoulda-matchers',           '~> 3.1.1', require: false
end

#For Heroku
gem 'rails_12factor', group: :production

gem "codeclimate-test-reporter", group: :test, require: nil
