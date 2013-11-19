아마 angular.js 로 프로젝트 진행하실때 ajax 에서 가장 먼저 부딪칠
부분이 cors 문제일겁니다. REST API 상에서 cors를 활성화 시키시려면
간단히 rack-cors gem을 사용하시면 됩니다. 대부분 모바일 브라우저는
cors enable 된 api에 대해 cross domain ajax를 지원합니다. 별도
웹서버를 운영하신다면 http://enable-cors.org 를 참고하여 apache나
nginx에서 cors enable을 하시거나.. grunt를 사용한다면
grunt-connect-proxy 를 사용하셔서 reverse-proxy를 사용하셔도 되고요

보통 production 환경에서는 nginx나 apache의 reverse proxy를 많이 사용합니다.
