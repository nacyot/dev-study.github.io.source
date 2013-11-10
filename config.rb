require './app/controllers/controller_test.rb'
require './app/controllers/activerecord_test.rb'
require './app/models/post.rb'

activate :livereload
activate :sprockets
sprockets.append_path File.join 'app', 'assets', 'javascripts'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Activerecord Settings
ActiveRecord::Base.configurations = YAML.load_file './config/database.yml'
ActiveRecord::Base.establish_connection 'development'

# Build-specific configuration
configure :build do
end

Post.all.each do |post|
  proxy "/post/#{post.title}.html", "/post/template.html", :locals => {:post => post }, :ignore => true
end

# art = ActiverecordTest.new
# art.hello
