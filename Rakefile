require './config/boot.rb'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

namespace :middleman do
  desc "Server"
  task :server do
    `bundle exec middleman server --reload-paths=./config.rb`
  end

  desc "Guard"
  task :watch do
    sh 'MIDDLEMAN_ENV=test bundle exec guard', verbose: true
  end
end

namespace :db do
  namespace :test do
    task :environment do
      require 'active_record'
      ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'db/test.sqlite3'
    end
  
    desc "Migrate the database"
    task(:migrate => :environment) do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
      # ActiveRecord::Migration.verbose = false
      ActiveRecord::Migrator.migrate("db/migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    end
  end
end
