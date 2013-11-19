angular ajax 관련해서 설정법을 정리해서 올립니다.

## 1. rack-cors를 사용하는 경우

이 경우는 access-control-allow-origin 가 response header에 활성화 되어
있을겁니다. angular에서

```javascript
myApp.config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);
```

를 추가해줍니다. angular가 X-Requested-With에 XMLHTTPRequest를
request시 header에 추가해주어 서버에서 일반적인 ajax로 인식하게
됩니다. 해당 header를 삭제시켜주는 구문입니다.

## 2. cors를 설정을 하지않고 grunt의 reverse proxy를 사용하는 방법

```sh
npm install grunt-connect-proxy --save-dev # 패키지 설치
```

gruntfile 설정

```javascript
// 상단에 추가
var proxySnippet = require('grunt-connect-proxy/lib/utils').proxyRequest;

// grunt.initConfig 내에 설정 추가
connect : {
  // ...
  proxies: [
    {
      host: 'example.com',
      port: 80,
      https: false,
      changeOrigin: true
    }
  ],
  // ...
  livereload: {
    options: {
      middleware: function (connect) {
        return [
          // ..
          proxySnippet, // proxySnippet 미들웨어에 추가
          // ...
        ];
      }
    }
  },
  // ...
}

// grunt.registerTask에 추가
grunt.registerTask('server', function (target) {
  // ...
  grunt.task.run([
    'clean:server',
    'concurrent:server',
    'configureProxies', // 이 부분을 connect 앞에 추가
    'connect:livereload',
    'open',
    'watch'
  ]);
  // ...
});
```

