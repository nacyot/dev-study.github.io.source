require 'middleman'
require 'capybara/rspec'

require 'coveralls'
Coveralls.wear!

require 'factory_girl'
require 'factory_girl_rails'

require 'rspec/autorun'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.fixture_path = "/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
end

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :development
  set :show_exceptions, false
end
