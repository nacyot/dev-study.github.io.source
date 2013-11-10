# -*- coding: utf-8 -*-
# Require actionpack
require 'abstract_controller'
require 'action_controller'

# Connect database
require './config/connect_database.rb'

# Autoload app directory
Dir[File.join("app/models**/*.rb")].each {|file| require file }
Dir[File.join("app/decorators**/*.rb")].each {|file| require file }
Dir[File.join("app/controllers**/*.rb")].each {|file| require file } 

# Set Routings
require './config/routes.rb'
Routes.routes proxy_manager

# Activate modules
# activate :livereload
# activate :sprockets

# Directory configure
sprockets.append_path File.join 'app', 'assets', 'javascripts'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Markdown configure
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Set reload path

# Build-specific configuration
configure :build do
  
end

