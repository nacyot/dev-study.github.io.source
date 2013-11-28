require 'middleman'
require 'database_cleaner'
require 'capybara/rspec'
require 'coveralls'
require 'factory_girl'
require 'rspec/autorun'
require './config/boot.rb'
Dir[File.join("./spec/factories**/*.rb")].each {|file| require file }

# Coveralls
Coveralls.wear!

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
end

Capybara.app = Middleman::Application.server.inst do
  root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  ENV['MM_ROOT'] = root
  set :root, root
  set :environment, :test 
  set :show_exceptions, false
end
