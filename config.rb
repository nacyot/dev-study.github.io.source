# -*- coding: utf-8 -*-
require './config/middleman_routes.rb'
require './config/routes.rb'
require './config/boot.rb'
require './lib/render.rb'

# Set Routings
Routes.set_managers proxy_manager, ignore_manager
Routes.proxy_routes

# Helpers
helpers PresentationHelper

# Activate modules
# activate :livereload
# activate :sprockets

# Directory configure
sprockets.append_path File.join 'app', 'assets', 'javascripts'
set :css_dir, '.stylesheets'
set :js_dir, './javascripts'
set :images_dir, './images'

# Markdown configure
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Build-specific configuration
configure :build do
end

