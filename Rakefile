require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

namespace :middleman do
  desc "Server"
  task :server do
    `bundle exec middleman server --reload-paths=./config.rb`
  end

end
