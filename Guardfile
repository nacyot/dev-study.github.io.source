# -*- coding: utf-8 -*-
guard 'middleman' do
  watch(%r{^config.rb})
  watch(%r{^data/.*})
  watch(%r{^source/.*})
  watch(%r{^views/.*})
  watch(%r{^public/.*})
  watch(%r{^app/.*})
end

guard :rspec do
  watch('spec/spec_helper.rb') { "spec" }
  watch('config.rb') { "spec" }
  watch('config/routes.rb'){ "spec" }
  watch('config/connect_database.rb'){ "spec" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }

  watch(%r{%source/javascripts/.+\.(js|coffee|ejs)$}) { "spec" }
  watch(%r{%source/stylesheets/.+\.(css|less|scss)$}) { "spec" }
  watch(%r{%source/.+\.(erb|haml|slim)$}) { "spec" }
end

