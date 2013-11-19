메인 저장소에 pull request 된 소스코드 쉽게 가져오는 법 공유합니다.

일단 project/.git/config 파일의 upstream 부분에

```bash
fetch = +refs/pull/*/head:refs/remotes/upstream/pr/*
```

부분을 추가하고 `git fetch upstream` 하시면 됩니다. pr에는 원하는 이름
쓰셔도 됩니다. pull_request라고 하셔도 되고. 아무튼 이렇게 하면 메인
프로젝트에 pull request된 ref들을 가져오고 원하는 pull-request로
checkout 하시면 됩니다.

```sh
git checkout upstream/pr/<number>
```

ref 리스트가 보고 싶으시면 `git show-ref` 명령어를 실행시키면 됩니다.

링크는 제가 사용하고 있는 config 파일입니다. repository url 수정하셔서
사용하셔도 됩니다.

* https://gist.github.com/nacyot/6505154

아래 gist 참조했습니다.

* https://gist.github.com/piscisaureus/3342247
