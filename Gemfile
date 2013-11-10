source 'http://rubygems.org'

# Base gems
gem "rake"

# Middleman
gem "middleman", "~> 3"
gem "middleman-livereload", "~> 3"
gem "wdm", "~> 0", :platforms => [:mswin, :mingw]

# Database gems
gem "sqlite3"
gem "activerecord"
gem "sinatra-activerecord"

# Formatter gems
gem "haml"
gem 'therubyracer'
gem "less"
gem "redcarpet"

# Watch gems
# gem "shotgun"
gem "guard-middleman"

# gems
gem "draper", "~> 1"

group :development, :test do
  # Test gems
  gem 'rspec'
  gem 'coveralls', require: false
  gem 'factory_girl', :require => false
  gem 'faker'
  gem 'database_cleaner', '=1.0.1'
  gem 'shoulda'
  gem "capybara"
end
