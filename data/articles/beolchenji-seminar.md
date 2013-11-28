http://onoffmix.com/event/18458

## 오프닝 : 10분

오프닝 및 한국센차유저그룹 활동 및 프로젝트 소개

http://sencha.or.kr

## 세션1 : 30분  
* 주제 : SenchaCon 2013 & Sencha Space !!
* 내용 : SenchaCon 2013 현장에서 다뤄진 주요 이슈들을 요약하고,
특히 Sencha 야심차게 준비하고 있는 Sencha Space에 대해
살펴본다.
* 발표자 : 김태원. 한국센차유저그룹 부운영자 me.kinotl.com =>
아직 정보없슴
* http://senchacon.com/2013

## 2교시 : 50분
* 주제 : Webkit 엔진 분석 및 고성능 Mobile HTML5 어플리케이션
최적화 Practice
* 내용 : [앵콜 세미나] 지난 1회 세미나 설문조사에서 “다시 듣고
싶은 세미나” 선정
HTML5 어플리케이션 최적화 관점에서 필수적으로 알아야 할 WebKit
엔진의 구조를 살펴보고, 이를 기반으로 HTML5의 핵심 기능인 CSS3
와 Canvas 기반 어플리케이션의 성능을 최적화 시 적용 가능한
방법들에 대해서 실무 적용 가능한 기술위주로 설명
* 발표자 : 임상석 팀장 (SK플래닛, Web 기술개발팀) PT by
impress.js
* 이전 세미나 http://readme.skplanet.com/?p=4777
10월1일 공개하는 OK케쉬백 UX, Play4me(네이티브같은 HTML5 app.
개발중)
* key msg: Chrome Dev Tool ( DOM inspector)를 잘 쓰라.
* a tip for speed up
* http://stackoverflow.com/questions/10814178/css-performance-relative-to-translatez0
* http://www.html5rocks.com/en/mobile
* Chrome://tracing 긍극의 최하단 덤프
* DumpRenderTree
* 성능 최적화: Layout & Repainting을 최소화하라.
* 모바일 단말 Anomaly(불규칙) 고려할것

## 3교시 : 50분
* 주제 : 일석삼조 : 하나의 코드로 3대 앱스토어 때려잡기
* 내용 : 하이브리드 웹 앱의 장점으로 꼽는 원 소스 멀티 유즈는
정말로 가능한가. 하나의 코드를 가지고 웹 및 애플,구글,MS
앱스토어 등록을 마치기 까지의 과정. 웹앱과 하이브리드 앱의
기술, UX 부분에서의 특징. 그에 따른 전략 등
* 발표자 : 함경우 매니저, (SK 커뮤니케이션즈, UX개발센터
UI개발팀)
* http://phonegap.com


##  4교시 : 50분
* 주제 : 웹 개발 필수도구 Fiddler 디버깅 프록시 활용법
* 내용 : 강력한 기능을 탑재한 웹 디버깅 프록시인 Fiddler에
탑재된 HTTP/HTTPS 트래픽 모니터링, 트래픽 조작, 트래픽 필터링,
모바일 기기 디버깅 등의 기본적인 기능을 살펴본 후,
자바스크립트와 유사한 내장 스크립팅 기능을 사용해 자신만의
기능을 추가하는 고급 활용까지 설명
* 발표자 : 김태곤 Lead Front-End Engineer (Thing Daemon, Inc.)
* mygony.com @taggon
* http://fiddler2.com/ 단점: 윈도우에서만 작동
* 기능: 모니터링(트레픽 조사), 조작, 확장(플러그인)

----

* 모니터링
* 툴바 [DECODE] : 모든 RESPONSE를 압축해제(자원을 많이 소모함)
* [Syntaxview] 따로 설치해야함 : color code view
* option > HTTPS 설정에서 HTTPS도 캡춰가능
* 데이터 필터링 : menu Rules > Hide CONNECTs  or  Filter tab.
* 툴바 [Any Process] 드래그하여 브라우저에 드롭하면 해당
* 페이지만 보여줌

----

* 조작
* breakpoint 설정: AutoResponder or 피들러 스크립트/확장 기능
* AutoResponder tab 기능: local file, redirection, 404 error 로 설정가능 
* => Unmatched request passth.. 반드시 on 할것

----

* 확장기능
* 피들러 스크립트 JS script.net: 요청/응답 세션 필러팅, 헤더
* 본문 수정, 메뉴 추가, 외부 프로그램 수행
* Rules > Customize Rules..

----

* 활용팁
* 모바일 기기 디버깅 : 외부접속 허용가능(option > Connections > proxy port 설정)
* 인터넷 속도를 느리게 설정 가능: Rules > Performance > Simulate Modem Speeds
* 리셋하기 : shift 누르고 단축 아이콘 클릭  

## 5교시 : 50분
* 주제 : PhantomJS 와 Ext JS로 구현하는 자동화 모니터링
* 솔루션(Hamlet)
* 내용 : 사람이 관여하지 않아도 유령처럼 스스로 JavaScript 로
동작하는 Webkit 있다고?? 매 시간마다 내 대신 웹 사이트에
접속하여 테스트 시나리오를 수행 해 주는 PhantomJS 를 이용하여
자동화 모니터링 솔루션을 만들고 이렇게 누적된 데이터를 Ext JS
의 Chart 와 Grid로 표현하는 "Hamlet"솔루션을 공개 한다
* 발표자 : 김종광 수석연구원(미래웹기술연구소, 한국센차유저그룹 운영자)
* 유사 솔루션: zabbix(테스트 시나리오 불편), monitor.us,
* uptimerobot.com

----

* casperjs.org (need phantomJS)
* casper.start("http://url.com");  casper.then(f() { this.sendKeys("keyWord")   this.click("#qBtn")  ... 
* ID 없어도 XPath로 접근 가능

----

* ExtJS
* http://www.sencha.com/products/extjs

----

* HAMLET
* http://d2fest.sencha.or.kr

## 특별세션 : 20분

* 주제 : 한국센차유저그룹 2013 프로젝트 공개 : ESTAR Project
* 내용 : 2013년도 3월부터 시작한 ESTAR 프로젝트 소개와
소스코드를 공개. 자폐 디자이너의 활동을 응원하는 앱으로써,
한국센차유저그룹이 SK플래닛의 후원을 받아 제작한 앱을 공개.
* Sencha Inc. 공인 Instructor가 감수한 소스코드 공개 => Sencha
개발에 많은 참고가 될것.
* http://estar.sencha.or.kr
* http://sencha.or.kr
