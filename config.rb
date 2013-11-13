# -*- coding: utf-8 -*-
require './config/boot.rb'

# Set Routings
require './config/routes.rb'
Routes.routes proxy_manager, ignore_manager

# Activate modules
# activate :livereload
# activate :sprockets

# set :database, "sqlite://db/#{ENV['MIDDLEMAN_ENV']}.sqlite3"

# Directory configure
sprockets.append_path File.join 'app', 'assets', 'javascripts'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Markdown configure
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# ignore "/post/template.html"

# Set reload path


# Build-specific configuration
configure :build do
  
end

