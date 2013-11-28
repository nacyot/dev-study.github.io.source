```ruby
# 기본적인 설정을 담당하는 부분

# Gem을 가져올 서버 명시
source 'https://rubygems.org'
# 사용하는 Ruby 버전 지정
ruby '2.0.0'

# 사용할 Gem 열거
# Gem에 대한 자세한 사용법은 각 github README 파일이나, Wiki에
# 있습니다. 어디까지나 간단한 설명을 위한 리스트입니다.

# 관련된 부분도 이슈에 올려두도록 하겠습니다. 설치해보고 싶으신 Gem
# 있으면 프로젝트에 직접 적용해보셔도 됩니다.

# Rails
# https://github.com/rails/rails
# Rails 프로젝트에서 가장 기본적인 Gem.
gem 'rails', '4.0.0'

# rails_admin
# https://github.com/sferik/rails_admin
# Rails 프로젝트에 관리 간단히 관리 기능을 더해주는 Gem.
gem 'rails_admin', github: "sferik/rails_admin", branch: "rails-4"

# javascript
# https://github.com/cowboyd/therubyracer
gem 'therubyracer'
# https://github.com/sstephenson/execjs
gem 'execjs'

# Devise
# https://github.com/plataformatec/devise
# authentication(인증) 기능
gem 'devise'

# Simple form
# https://github.com/plataformatec/simple_form
# Form 지원 확장
gem 'simple_form'

# Kaminari
# https://github.com/amatsuda/kaminari
# pagination(페이지 기능)
gem 'kaminari'

# Pry
# https://github.com/pry/pry
# Ruby REPL 확장(다양한 기능들이 추가된 irb)
gem 'pry'

# Faker
# https://github.com/stympy/faker
# 더미 데이터 생성(데이터 시드 / 테스트에 사용)
gem 'faker'

# gravatar
# https://github.com/mdeering/gravatar_image_tag
# 사용자 이미지 생성(gravatar.com 서비스 이용)
gem 'gravatar_image_tag'

# ruby-pg
# https://bitbucket.org/ged/ruby-pg/wiki/Home
# Postgresql 데이터베에스 연결
# Heroku에서는 기본적으로 Postgresql을 지원합니다.
gem 'pg'

# Rails 12 Factor
# https://github.com/heroku/rails_12factor
# Heroku 배포시에 사용하는 젬.
# 이 젬을 사용하지 않으면 Heroku 배포시 asset 파일들을 제대로 사용할
# 수 없습니다.

gem 'rails_12factor'

# SQLite3/Ruby Interface
# https://github.com/sparklemotion/sqlite3-ruby
# sqlite를 사용할 수 있게 해줍니다.
# 이미 눈치 채신 분도 계시겠지만 Rails에서는 기본적으로 Sqlite
# 사용하며, db 폴더에 각 환경에 대한 DB 파일이 생성되어 있습니다.
gem 'sqlite3'

# Better Errors
# https://github.com/charliesome/better_errors
# 어플리케이션에 문제 있을 때 좀 더 에러 페이지에 더 다양한 정보를
# 제공합니다.
gem "better_errors"

# Better Errors의 에러페이지에서 바로 repl(유사 irb)을 사용할 수 있게
# 해줍니다.
gem "binding_of_caller"

# Rack mini profiler
# https://github.com/SamSaffron/MiniProfiler
# 페이지 상에 로딩 속도 및 sql 쿼리 등 추가적인 정보를 출력해줍니다.
# 설치하면 페이지 로드시 왼쪽 상단 모서리에 작은 박스가 생깁니다.
gem 'rack-mini-profiler'

# Spring
# https://github.com/jonleighton/spring
# Rails preloader. Rails와 관련된 명령어 실행을 빠르게 해줍니다.
gem 'spring'

# Rails에서 기본적으로 사용하는 asset 관련 Gem
# https://github.com/rails/coffee-rails
gem 'coffee-rails', '~> 4.0.0'
# https://github.com/lautis/uglifier
gem 'uglifier', '>= 1.3.0'
# https://github.com/rails/jquery-rails
gem 'jquery-rails'
```
