# Activerecord Settings
ActiveRecord::Base.configurations = YAML.load_file './config/database.yml'
ActiveRecord::Base.establish_connection 'development'
