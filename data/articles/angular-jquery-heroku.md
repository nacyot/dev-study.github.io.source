# Angular 생성에서 Heroku로 보내기

## 1. Yoeman을 사용하여 Angular 프로젝트를 생성한다.

프로젝트를 위한 디렉토리 생성

```sh
$ mkdir NewsQ
$ cd NewsQ
```

yoeman으로 angular 프로젝트 만들기

방법 1 - yo를 실행시킨 후 angular generator를 선택 후 엔터

```sh
$ yo
Run the Angular generator 
```

방법 2 - yo 를 실행 시킬 때 angular 옵션으로 실행

```sh
$ yo angular
-. 검증
$ grunt build
$ grunt server:dist
```

웹 브라우저에서 샘플 페이지가 보여지면 OK

* 바로 .gitignore 파일에서 dist 삭제한다

* grunt build 시 아래와 같은 에러가 나면 해결책은 ????

> You need to have Ruby and Compass installed and in your system PATH
> for this task to work. More info: https://github.com/gruntjs/grun
> t-contrib-compass Use --force to continue.


## 2. Yoeman을 실행해서 heroku generator를 실행한다.
 
```sh
$ yo heroku
# 또는
$ yo를 실행한 후 Run the Heroku generator
# 선택 후 엔터
```

그리고 아래를 Yes 선택

```
Do you want a separate git repository in dist/? 
```

## 3. Gruntfile.js 파일을 수정한다.

위에서 yo heroku를 아래의 마지막에 코드를 추가하라고 나온다

```javascript
copy: {
  dist: {
    files: [{
      expand: true,
      dest: '<%= yeoman.dist %>',
      cwd: 'heroku',
      src: '*',
      rename: function (dest, src) {
        var path = require('path');
        if (src === 'distpackage.json') {
          return path.join(dest, 'package.json');
        }
        return path.join(dest, src);
      }
    }]
  }
}
```

아래를 찾아서

```javascript
// Put files not handled in other tasks here
copy: {
  dist: {
    files: [{
      expand: true,
      dot: true,
      cwd: '<%= yeoman.app %>',
      dest: '<%= yeoman.dist %>',
      src: [
        '*.{ico,png,txt}',
        '.htaccess',
        'bower_components/**/*',
        'images/{,*/}*.{gif,webp}',
        'styles/fonts/*'
      ]
      }, {
        expand: true,
        cwd: '.tmp/images',
        dest: '<%= yeoman.dist %>/images',
        src: [
          'generated/*'
        ]
    }  ]      //  ←-- 요기에 추가
  },
  styles: {
    expand: true,
    cwd: '<%= yeoman.app %>/styles',
    dest: '.tmp/styles/',
    src: '{,*/}*.css'
  }
},
```

다음으로

```sh
grunt build
```

## 4. Git 초기화 및 Commit 과 Push

시작하기 전에  .gitignore 파일을 열어서 dist 폴더가 추가되어 있는지
확인해보고 있다면 dist를 지운다

```sh
$ git init
$ git add .
$ git commit -m “Init Commit for Heroku”
$ heroku create newsq
$ git subtree push --prefix dist heroku master
…..
-----> Launching... done, v4
http://newsq.herokuapp.com deployed to Heroku

To git@heroku.com:newsq.git
* [new branch]      9d5b1e3e721e93c2f918f247a4ad522b09e50cff ->
master
```

## 5. 브라우저를 실행해서 확인해 보다

http://newsq.herokuapp.com 

# Grunt를 이용해 Heroku로 보내기

## 1. grunt-shell 설치

```sh
npm install --save-dev grunt-shell
```

## 2. Gruntfile.js 수정

grunt.initConfig 안에서 마지막 부분에 아래를 추가

```javascript
shell: {
  'git-add-dist': {
    command: 'git add '
  },
  'git-commit-build': {
    command: 'git commit -am"build"'
  },
  'heroku': {
    command: 'git subtree push --prefix dist heroku master'
  }
}
```

그리고 그 밑에(grunt.initConfig 끝난 바로 밑)  아래 코드를 추가

```javascript
grunt.loadNpmTasks(‘grunt-shell’);
```

아래의 grunt.registerTask들을 추가

```javascript
grunt.registerTask('git', [
'shell:git-add-dist',
'shell:git-commit-build'
]);

grunt.registerTask('heroku', ['build', 'git',
'shell:heroku']);
```

이렇게 하면

```sh
$ grunt git
```

명령어로 git add .. , git commit .. 을 실행하고

```sh
grunt heroku
```

명령어로 git subtree push … 를 실행한다

# jQuery PlugIn을 위한 Directive 만들기

# 1. brewer를 이용하려 jQuery PlugIn을 설치한다

```sh
bower install
https://raw.github.com/malsup/malsup.github.com/master/jquery.cycle2.js
```

## 2. yoeman을 이용하여 cycle directive를 만든다

```sh
yo angular:directive cycle
```

## 3. 위에서 생성한 directive의 코드를 아래와 같이 수정

```javascript
.directive('cycle', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
    $(element).cycle({
      fx: 'fade',
      timeout: 10
    });
  }
};
```

## 4. PlugIn의 인자를 HTML Tag 부분으로 옮기기

```html
<div class="slideshow" cycle>
```

=>

```html
<div class="slideshow" cycle = “{fx: 'fade', timeout: 10}”>
```

```javascript
$(element).cycle({
  fx: 'fade',
  timeout: 10
});
```

=>

```javascript
$(element).cycle(scope.$eval(attrs.cycle));
```
