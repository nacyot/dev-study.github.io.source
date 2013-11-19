# 현재 git repo 구조에서의 git 사용 테스트

```sh
$ git remote add upstream https://github.com/dev-study/vsns.git
```

## git branch      (현재 git repo 구조 - 유닛repo 과 메인 repo)

1. **A** 로컬 : master
1. **B** 유닛 fork repo : origin/doohee323
1. **C** 메인 main upstream repo : upstream/master
1. **D** 유닛 upstream repo : upstream/doohee323

## ~/git/vsns/.git$ vi config

```bash
[branch "master"]
        remote = origin
        merge = refs/heads/doohee323
[remote "origin"]
        url = https://github.com/doohee323/vsns.git
        # fech 시 B로부터 받겠다.
        fetch = +refs/heads/doohee323:refs/remotes/origin/doohee323 
        # push 시 B에 넣겠다.
        push = +refs/heads/master:refs/heads/doohee323
[remote "upstream"]
        url = https://github.com/dev-study/vsns.git
        # fech 시 C로부터 받겠다.
        fetch = +refs/heads/master:refs/remotes/upstream/master
        # push 시 D에  넣겠다.
        push = +refs/heads/master:refs/heads/doohee323
```

## 정상상황

```sh
$ git checkout master
# 로컬이 origin/doohee323 과 다를 경우 merge
$ git merge origin/doohee323   
```

## 충돌 상황 1

```sh
$ git checkout master
Gemfile.lock: needs merge
error: you need to resolve your current index first

To git@github.com:doohee323/vsns.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:doohee323/vsns.git'
```

### 충돌 확인 1 및 조치
```sh
$ git mergetool
$ git reset --merge
```

### 남은 조치

```sh
$ git checkout master
Already on 'master'
Your branch is ahead of 'origin/master' by 38 commits.

# (모두 무시하고 C - upstream/master 를 내려 받기)
$ git checkout master
$ git reset --hard upstream/master

# (모두 무시하고 D - upstream/master 를 내려 받기)
$ git reset --hard origin

# (local master를 B - origin/dohee323 로 올리기)
$ git push -u origin master

# (local master를 D - upstream/dohee323 로 올리기)
$ git push -u upstream master

# cf. 강제로 올리기
$ git push origin master --force    
```

## merge tool 설정 확인
```sh
$ git config --list
user.email=doohee323@gmail.com
user.name=Dewey Hong
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
remote.origin.url=https://github.com/doohee323/vsns.git
branch.master.remote=origin
branch.master.merge=refs/heads/master
remote.heroku.url=git@heroku.com:vsns.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
remote.upstream.url=https://github.com/dev-study/vsns.git
remote.upstream.fetch=+refs/heads/*:refs/remotes/upstream/*
merge.conflictstyle=diff3
```

## diff 툴 추가
```
$ git config --global merge.tool diff3
```

## 관련 동영상

* http://www.youtube.com/user/cli23/videos

