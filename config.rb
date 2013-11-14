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
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :http_prefix, ''

# Markdown configure
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
    # set :http_prefix, "/Content/images/"

  # set :http_prefix, "./"

end

