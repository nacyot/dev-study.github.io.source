dev.study
=========

[![Code Climate](https://codeclimate.com/github/dev-study/dev-study.github.io.source.png)](https://codeclimate.com/github/dev-study/dev-study.github.io.source)
[![Build Status](https://travis-ci.org/dev-study/dev-study.github.io.source.png?branch=master)](https://travis-ci.org/dev-study/dev-study.github.io.source)

이 저장소는 [Dev.Study Archive](http://dev-study.github.io) 사이트의 소스코드입니다.

## 설치

```sh
git clone git@github.com:dev-study/dev-study.github.io.source.git
bundle install
bower install
bundle exec middleman server --port=4567
```

## 구조

이 어플리케이션은 정적 페이지 생성기인 [Middleman]()을 사용해서 만들어져있습니다. 소스 코드가 업데이트 되면 Travis를 통해 사이트 전체를 다시 빌드하고, Github로 업로드하는 구조로 이루어집니다.

### Middleman 명령어
#### 사이트 빌드하기

```sh
bundle exec middleman build
```

#### preview 서버
```sh
bundle exec middleman server --port=4567
```

#### 자동 빌드 및 서버 기동
```sh
bundle exec guard
```

```sh
cd build
ruby -run -e httpd . -p4567
```

### 디렉토리 구조

* app/assets
* app/controllers
* app/decorators
* app/helpers
* app/models
* config
* data
* source

### Source 디렉토리 구조

```
├ ── articles                    # Article 템플릿
├ ── fonts
├ ── hangouts                    # Hangout 템플릿
├ ── images
├ ── javascripts
├ ── layouts
├ ── pages                       # 주요 페이지
│    ├── about.html.haml
│    ├── articles.html.haml
│    ├── hangouts.html.haml
│    ├── _items.html.haml
│    ├── missions.html.haml
│    ├── presentations.html.haml
│    ├── projects.html.haml
│    ├── references.html.haml
│    └── video.html.haml
├ ── partials
├ ── presentations               # 프레젠테이션 템플릿
├ ── stylesheets
│    └── syntax
└ ── tags                        # 태그 템플릿
```

## 데이터

데이터는 /data 폴더에 YAML 형식으로 저장되어있습니다. 데이터의 추가/변경/삭제는 각각의 파일을 직접 수정하면 Middleman 빌드 시에 변경사항이 자동으로 반영되어 페이지가 추가됩니다. 이에 대해에서는 데이터 포맷에서 다룹니다.

```sh
articles.yaml       # 글
hangouts.yaml       # 행아웃
presentations.yaml  # 프레젠테이션
references.yaml     # 링크
user.yaml           # 멤버
```

아래의 파일들은 정리중이거나 사이트에 실질적으로 반영되지 않습니다.

```sh
missions.yaml       # 미션 (반영되지 않음)
discussions.yaml    # 페이스북 토론 (반영되지 않음)
projects.yaml       # 프로젝트 (반영되지 않음)
```

## 데이터 포맷

데이터는 YAML 파일로 data 폴더에 저장되어있습니다. 각각의 페이지들은 데이터를 바탕으로 생성되며 데이터를 추가하거나 삭제하면 페이지 역시 생성되거나 삭제됩니다.

### YAML
YAML의 기본적인 포맷은 다음과 같습니다. 아래 포맷에 맞춰 실제 데이터를 추가하거나 삭제하면 됩니다.

#### 배열
```ruby
data = """
- data1
- data2
- data3
"""

YAML.load(data)
# => ["data1", "data2", "data3"]
```

#### 해시
```ruby
data = """
name: nacyot
email: propellerheaven@gmail.com
location: seoul
"""

YAML.load(data)
# => {"name"=>"nacyot", "email"=>"propellerheaven@gmail.com", "location"=>"seoul"}
```

#### 배열 + 해시
실제 데이터는 다음과 같은 방식으로 구성됩니다. 

```ruby
- data = """
  name: nacyot
  email: propellerheaven@gmail.com
  location: seoul
- data = """
  name: yrcant
  email: yrcant@gmail.com
  location: incheon
"""

YAML.load(data)
# => [
#   {"name"=>"nacyot", "email"=>"propellerheaven@gmail.com", "location"=>"seoul"},
#   {"name"=>"yrcant", "email"=>"yrcant@@gmail.com", "location"=>"incheon"}
# ]
```

#### 기타
YAML에서는 따옴표(")없이 바로 string을 사용할 수 있으나 이 경우 몇몇 문자(-, : 등)에 제한이 있습니다. 이 경우 앞 뒤에 따옴표를 붙여 명시적으로 값이 문자열임을 나타낼 수 있습니다.

### Article
```yaml
- title: 기사 제목 (String)
  author: 작성자 (String)
  link: 기사 출처 링크 (String)
  source: 기사 소스 location (String)
  target: 기사 url (String)
  date: %Y-%m-%d (Date)
  published: yes/no (Boolean)
  tags: 태그 (String Array)
  comments: 댓글 (Hash Array)
    - name: 작성자 (String)
    - date: %Y-%m-%d  (Date)
    - body: 댓글 본문 (String
```

### Hangout
```yaml
- title: 기사 제목 (String)
  author: 작성자 (String)
  target: 기사 url (String)
  video: 행아웃 영상 주소 (String)
  date: %Y-%m-%d (Date)
  links: 링크 배열 (String Array)
  tags: 태그 (String Array)
```

### Presentation
```yaml
- title: 기사 제목 (String)
  author: 작성자 (String)
  target: 기사 url (String)
  video: 행아웃 영상 주소 (String)
  slide: 슬라이드 주소 (String)
  date: %Y-%m-%d (Date)
  links: 링크 배열 (String Array)
  tags: 태그 (String Array)
```

### Reference
```yaml
- user: 작성자 (String)
  links: 링크 배열 (Hash Array)
    - title: 링크 제목 (String)
      link: 링크 URL (String)
```

### User
### Mission
### Discussion
### Project

