source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Postgres > sqlite
gem 'pg', '~> 0.21'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# GraphQL > REST
gem 'graphql', '~> 1.7.4'
# Using ActiveRecord has_secure_password
gem 'bcrypt', '~> 3.1.11'
# For nice filtering capabilities
gem 'ransack', '~> 1.8.6'
# Paginate all things!
gem 'kaminari', '~> 1.1.1'
# Enable CORS so javascript requests are welcome
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # graphiql so we can test our stuff
  gem 'graphiql-rails', '~> 1.4.4'
  # Get your face slapped when n+1 happens
  gem 'bullet'
end
