Bundler.require(:default)

Dotenv.load

# Require actionpack
require 'abstract_controller'
require 'action_controller'

# Connect database
require './config/connect_database.rb'

# Autoload app directory
Dir[File.join("./app/models**/*.rb")].each {|file| require file }
Dir[File.join("./app/decorators**/*.rb")].each {|file| require file }
Dir[File.join("./app/controllers**/*.rb")].each {|file| require file } 
