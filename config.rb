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
helpers MarkdownHelper
helpers LinkHelper

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
set :haml, { ugly: true }

# Another configure
set :relative_links, true

# Layout
page "pages/*", :layout => :articles_layout
page "tags/*", :layout => :articles_layout
# page "articles/*", :layout => :articles_layout
# page "hangouts/*", :layout => :articles_layout
# page "presentations/*", :layout => :articles_layout

page "/sitemap.xml", :layout => false

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
end

