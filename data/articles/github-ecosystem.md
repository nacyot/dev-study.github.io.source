# Author

* 작성자 : nacyot(Kim Daekwon\<propellerheaven@gmail.com\>)

# Introduction

소스 관리를 위해 Github와 바로 연동해서 사용할 수 있는 많은 좋은
서비스들이 있습니다. 이러한 서비스들의 장점은 github와 바로 연동할 수
있고 open-source에 대해서는 대개 무료로 사용할 수 있다는 점입니다. 이
서비스들을 이용하지 않아도 어차피 내부적으로 다 사용해야만 하는
기능들이기 때문에, 공개적으로 오픈소스 개발하시는 경우엔 적극 도입을
검토해보셔도 좋을 듯 합니다. 적용이 쉬운 것부터 차례대로 소개하도록
하겠습니다.

# [Code climate](https://codeclimate.com/)
Target : Ruby

Ruby 언어의 코드 메트릭스(복잡도, 코드 스멜, 코드 중복 등)를 계산하고
보고서를 작성해줍니다. 프로젝트 등록은 정말 쉽습니다.

> https://codeclimate.com/github/signup

위 URL에 가셔서 저장소 주소를 등록만 해주면 자동적으로 레포트를
만들어주고산

> https://codeclimate.com/github/GITHUB_ID/REPOSITORY_NAME

위 URL로 가시면 해당하는 저장소의 코드 상태를 볼 수 있습니다. 레포트는
푸쉬에 hook가 걸려있어 저장소에 새로운 변경사항이 올라올 때마다 새로
분석됩니다. 또한 오픈소스 프로젝트를 대상으로 하는 관계로 레포트
내용은 전부 공개됩니다.

# [Gemnasium](https://gemnasium.com/)
Target : Ruby

Gemnasium은 의존하고 있는 Library(Gem)의 최신버전 여부를 알려주는
서비스입니다. 역시 오픈소스는 무료로 사용할 수 있으며 매우 쉽게
연동시킬 수 있습니다. 사이트로 들어가셔서 github 아이디로 로그인
하시고, 필요한 저장소를 연동해주면 됩니다. 사실 저장소 등록에 직접적인
권한은 필요가 없으며,

> https://gemnasium.com/GITHUB_ID

위 url로 접근하시면 github에 올라와있는 어떤 프로젝트든지 등록이
가능합니다.

# [Rubydoc.info](http://rubydoc.info/)
Target : Ruby

Rubydoc.info는 YARD를 지원해주는 루비 온라인 문서화 서비스입니다.
사이트에 들어가셔서 오른쪽의 add project를 해주시면 해당하는 저장소의
문서가 자동적으로 생성됩니다. 대부분의 오픈소스 프로젝트에 있어
로컬에서 문서를 만들어 사용하기보다는 이 사이트를 이용하고 있습니다.

# [Travis](https://travis-ci.org/)
Target : -

Travis는 CI서버입니다. 역시 오픈소스에 대해서는 무료로 사용할 수
있습니다. Travis를 사용하면 Jenkins를 서버를 사용하는 등 번거로운
작업을 덜 수가 있으며, bundle, npm 등 패키지 관리자 뿐만 아니라
apt-get을 통한 프로그램 설치도 할 수 있어 매우 다양한 일들을 할 수
있습니다. Travis에 가능한 일들에 대해서는
[CI Environment](http://about.travis-ci.org/docs/user/ci-environment/)
문서를 참조해주시기 바랍니다.

## Travis 연동
Github의 저장소를 Travis와 연동하기 위해서는 repository 설정에서
Travis hook를 설정해줄 필요가 있습니다. 하지만 이 문제는 Travis 쪽에서
Github 아이디로 로그인을 하고 연동하려는 저장소를 on으로 바꿔주면 바로
연동이 됩니다. 여기까지만 해도 Push가 일어나면 Travis 쪽으로 빌드
요청이 보내지고, 자동적으로 빌드를 수행합니다. 하지만 아직까지는 어떤
일을 하라고 지정된 바가 없기 때문에 이에 대해서는 별개로 .travis.yml
파일을 어플리케이션 루트 폴더에 만들어서 기술하고, 저장소에
push해줍니다.

## .travis.yml 예제
현재 bbapi 저장소에 등록된 .travis.yml 예제입니다.

```yaml
language: ruby
rvm:
  - 1.9.3
  - 2.0.0
env:
global:
  - DB=sqlite3
script:
  - RAILS_ENV=test bundle exec rake db:create
  - RAILS_ENV=test bundle exec rake db:migrate --trace
  - bundle exec rspec spec/
before_script:
  - cp config/database.travis.yml config/database.yml
```

각각의 부분에 대해서 간단한 설명을 붙여두면,

```yaml
language: ruby
```

Ruby 언어의 사용을 명시합니다.

```yaml
rvm:
  - 1.9.3
  - 2.0.0
```

어떤 버전의 Ruby를 사용할 지 지정합니다. Travis에서는 매우 다양한
버전의 Ruby를 지원하고 있어 여러한 환경에서 테스트해볼 수 있습니다.
이런 식으로 버전이 지정되어 있는 경우 Push가 일어났을 때 두 환경
모두에 대해서 빌드를 수행합니다. 이 때 Gemfile에 Ruby version을
명시하면 이 설정과 충돌이 일어나므로 유의가 필요합니다.

```yaml
env:
  global:
     - DB=sqlite3
```

필요한 환경 변수를 지정합니다. 추가적으로 Travis에서는 환경변수를
암호화하는 방법도 제공하고 있어 필요한 경우 API_key 값과 같이 민감한
정보를 암호화해서 지정할 수도 있습니다. 이러한 암호화는 travis gem에서
추가적으로 설명합니다.

```yaml
script:
  - RAILS_ENV=test bundle exec rake db:create
  - RAILS_ENV=test bundle exec rake db:migrate --trace
    - bundle exec rspec spec/
before_script:
  - cp config/database.travis.yml config/database.yml
```

실제로 실행될 스크립트를 작성합니다. 여기서는 우선 before_script가
실행되고, script가 작동됩니다.

## travis gem
```
$ gem install travis
```

travis gem을 통해서 콘솔 상에서 travis의 빌드를 관리하거나 빌드 결과를
가져올 수 있습니다. 예를 들어

```
prog/bbapi$ travis branches
master:           #1    failed     Set class name of owner
GithubEcosystem:  #3    passed     Add some options to .rspec
prog/bbapi$ travis status
build #3 passed
```

와 같이 현재 저장소의 빌드 상황을 확인해 볼 수 있습니다.

### 환경변수 암호화
다음은 환경변수를 암호화하는 예입니다.

```
$ travis encrypt -r <github_id>/<repository_name>
FACEBOOK_API_KEY=<API_KEY>  --add
```

-r 에는 이 암호화된 환경변수를 사용할 저장소를 지정하고, --add
 플래그는 이 결과를 바로 .travis.yml에 추가하라는 의미를 가집니다.
 이러한 방식을 통해 API_KEY를 공개하지 않고 사용할 수 있습니다.

### 전체 명령어

>        accounts     displays accounts and their subscription status
>        branches     displays the most recent build for each branch
>        cancel       cancels a job or build
>        console      interactive shell
>        disable      disables a project
>        enable       enables a project
>        encrypt      encrypts values for the .travis.yml
>        endpoint     displays or changes the API endpoint
>        help         helps you out when in dire need of information
>        history      displays a projects build history
>        init         generates a .travis.yml and enables the project
>        login        authenticates against the API and stores the token
>        logs         streams test logs
>        monitor      live monitor for what's going on
>        open         opens a build or job in the browser
>        pubkey       prints out a repository's public key
>        raw          makes an (authenticated) API call and prints out the result
>        restart      restarts a build or job
>        setup        sets up an addon or deploy target
>        show         displays a build or job
>        status       checks status of the latest build
>        sync         triggers a new sync with GitHub
>        token        outputs the secret API token
>        version      outputs the client version
>        whatsup      lists most recent builds
>        whoami       outputs the current user


## travis-lint gem
```
$ gem install travis-lint
```

travis-lint 프로그램을 사용해 설정파일이 정상적인지를 확인해볼 수 있습니다.

```
$ travis-lint                                                                                            
Hooray, /home/hsin/prog/_working/bbapi/.travis.yml seems to be solid!
```

# [Coveralls](https://coveralls.io/)
Target : -

Coveralls는 Test Coverage를 자동적으로 측정해주는 서비스로 Ruby를
비롯해 python, php, node.js, javascript, c, c++, java, sacala 등
다양한 언어에서 사용할 수 있습니다. Test coverage란 테스트를 실행하는
과정에서 실제 어플리케이션 코드가 알마만큼 실행되었는지를 %로 나타낸
수치입니다.


역시 Github과 연동할 수 있으면 실제 작동은 (일반적으로) Travis
서버에서 테스트가 실행된 결과를 바탕으로 Coveralls 쪽으로 레포트를
보내도록 되어있습니다. 따라서 반드시 Travis를 사용해야하고, 빌드
과정에서 Test(spec)을 실행해줄 필요가 있습니다.


## 저장소와 연동(Ruby 예제)
Travis 설정 외에도 coveralls를 실제 프로젝트에 적용시키기 위해서는
저장소에서 몇가지 설정을 해줄 필요가 있습니다. 먼저 Gemfile에
coveralls를 추가해줍니다.


```ruby
group :test do
  gem 'coveralls', require: false
  ...
end
```

다음으로 spec/spec_helper.rb 파일을 통해 coveralls(작업복)을
입혀줍니다. 일반적으로 spec_helper.rb 맨위에 기술해줄 필요가 있습니다.


```ruby
require 'coveralls'
Coveralls.wear!
```

로컬에서 테스트를 실행했을 때 아래와 같은 메시지가 뜨면 정상적으로 coveralls이 입혀진 상태입니다.

```
[Coveralls] Set up the SimpleCov formatter.
[Coveralls] Using SimpleCov's default settings.
...
[Coveralls] Outside the Travis environment, not sending data.
```

단 맨 마지막 로그에서 알 수 있듯이 Travis 환경이 아닌 곳에서는
데이터가 저장되지 않습니다. 이제 다음 push가 일어날 때부터 travis를
통해서 자동적으로 coveralls 페이지가 업데이트됩니다.


