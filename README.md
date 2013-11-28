dev.study
=========
oaeao
이 저장소는 Dev.Study Archive 사이트의 소스코드입니다.aoeaoe

## 구조
이 어플리케이션은 정적 페이지 생성기인 [Middleman]()을 사용해서
만들어져있습니다. 소스 코드가 업데이트 되면 Travis를 통해 사이트
전체를 다시 빌드하고, Github로 업로드하는 구조로 이루어집니다.

### Source 디렉토리 구조
```
├── articles                  # Article 템플릿
├── fonts
├── hangouts                  # Hangout 템플릿
├── images
├── javascripts
├── layouts
├── pages                     # 주요 페이지
│   ├── about.html.haml
│   ├── articles.html.haml
│   ├── hangouts.html.haml
│   ├── _items.html.haml
│   ├── missions.html.haml
│   ├── presentations.html.haml
│   ├── projects.html.haml
│   ├── references.html.haml
│   └── video.html.haml
├── partials
├── presentations             # 프레젠테이션 템플릿
├── stylesheets
│   └── syntax
└── tags                      # 태그 템플릿
```

## 데이터
데이터는 /data 폴더에 YAML 형식으로 저장되어있습니다. 데이터의
추가/변경/삭제는 각각의 파일을 직접 수정하면 Middleman 빌드 시에
변경사항이 자동으로 반영됩니다.

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
