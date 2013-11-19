grunt-shell을 추가하면 gruntfile.js에서 외부 프로그램을 실행할 수
있는데, 이 때 option { stderr : true, stdout : true} 옵션을 추가하면
외부 프로그램의 실행하면서 출력되는 내용을 볼 수 있습니다.

```javascript
shell: {
  'git-add-dist': {
  command: 'git add .'
},
  'git-commit-build': {
  command: 'git commit -am"build"'
},
'heroku': {
  options: {
    stdout: true,
    stderr: true
  },
  command: 'git subtree push --prefix dist heroku master'
  }
}
```

