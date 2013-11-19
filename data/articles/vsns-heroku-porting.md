# VSNS Heroku 포팅

VSNS를 fork한 repository를 Heroku 포팅하는 미션을 수행하기 위해서
수행한 작업을 정리했습니다. 그간 다양한 외도(windows에서 aptana로
적용하고 aptana에서 Heroku 배포, root 계정으로 rails 설치 및 구성 등)
끝에, 모두 내려놓고, ubuntu를 다시 설치하고 깨끗한 환경에서 처음부터
다시 작업했습니다. (불필요한 내용은 최소화하였음)

혹시 저 처럼 아직도 환경에 익숙하지 않은 분들에게 도움이 되길 바라며,
정리에 도움을 준 김한기 씨에게 감사드립니다.

##  순서

1. Github에서 받아 로컬PC 에 설치 하기
2. Github 에서 fork하기
3. Heroku에 올리기

## 1. Github에서 받아 로컬PC 에 설치 하기

### ruby, rails 설치

root 권한으로 설치하면 문제 발생

```sh
lhf@ubuntu:~/workspace/vsns$ whoami
lhf
lhf@ubuntu:~/workspace/vsns$ which bundle
/home/lhf/.rvm/gems/ruby-2.0.0-p247@global/bin/bundle
lhf@ubuntu:~/workspace/vsns$ ls -l /home/lhf/.rvm/gems/ruby-2.0.0-p247@global/bin/bundle
-rwxr-xr-x 1 lhf lhf 476 Aug 26 16:19 /home/lhf/.rvm/gems/ruby-2.0.0-p247@global/bin/bundle
lhf@ubuntu:~/workspace/vsns$ which rvm
/home/lhf/.rvm/bin/rvm
lhf@ubuntu:~/workspace/vsns$ which /home/lhf/.rvm/bin/rvm
/home/lhf/.rvm/bin/rvm
lhf@ubuntu:~/workspace/vsns$ which rails
/home/lhf/.rvm/gems/ruby-2.0.0-p247/bin/rails
lhf@ubuntu:~/workspace/vsns$ ls -l /home/lhf/.rvm/gems/ruby-2.0.0-p247/bin/rails
-rwxr-xr-x 1 lhf lhf 478 Sep  9 13:24 /home/lhf/.rvm/gems/ruby-2.0.0-p247/bin/rails
lhf@ubuntu:~/workspace/vsns$ ls -l /home/lhf/.rvm/bin/rvm
-rwxrwxr-x 1 lhf lhf 1428 Aug 26 16:12 /home/lhf/.rvm/bin/rvm
```

### 1.1 sudo 권한 주기(작업 계정 lhf 으로)

```sh
# root 권한으로
visudo
# or
nano /etc/sudoers
```

아래와 같이 수정

```
root    ALL=(ALL:ALL) ALL
lhf  ALL=(ALL)  ALL
```

### 1.2 rvm 설치

```sh
curl -L https://get.rvm.io | bash -s stable
```

### 1.3 ruby 설치

```sh
vi .bashrc

```
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/home/lhf/.rvm/bin
```

```sh
$ rvm install 2.0.0
$ /bin/bash --login
$ rvm --default 2.0.0
```

### 1.4 rails 설치

```
$ gem install rails --version 4.0.0
```

### 1.5 github로 받기

```sh
$ sudo apt-get install git
$ git clone https://github.com/dev-study/vsns.git vsns
$ cd vsns
$ bundle install
```

cf. https://github.com/dev-study/vsns

```sh
$ rake db:migrate
$ rails s
http://localhost:3000
```

### << bundle install 오류 수정 >>

#### nokogiri  설치 오류

> Gem files will remain installed in /home/lhf/.rvm/gems/ruby-2.0.0-p247/gems/nokogiri-1.5.10 for inspection.
> Results logged to /home/lhf/.rvm/gems/ruby-2.0.0-p247/gems/nokogiri-1.5.10/ext/nokogiri/gem_make.out
> 
> An error occurred while installing nokogiri (1.5.10), and Bundler cannot continue.
> Make sure that `gem install nokogiri -v '1.5.10'` succeeds before bundling.

해결 방법

```sh
sudo apt-get install libxslt-dev libxml2-dev 
```

#### gem install pg 에러

> Gem files will remain installed in /home/lhf/.rvm/gems/ruby-2.0.0-p247/gems/pg-0.16.0 for inspection.
> Results logged to /home/lhf/.rvm/gems/ruby-2.0.0-p247/gems/pg-0.16.0/ext/gem_make.out
> 
> An error occurred while installing pg (0.16.0), and Bundler cannot continue.
> Make sure that `gem install pg -v '0.16.0'` succeeds before bundling.

해결 방법

```sh
sudo apt-get install postgresql-9.1 
sudo apt-get install postgresql-server-dev-9.1
```

#### rmagick  설치 오류

> An error occurred while installing rmagick (2.13.2), and Bundler cannot continue.
> Make sure that `gem install rmagick -v '2.13.2'` succeeds before bundling.

해결방법

```sh
sudo apt-get install libmagickwand-dev
```

### << rake db:migrate 오류 >>

```sh
lhf@ubuntu:~/workspace/vsns$ rake db:migrate
rake aborted!
Devise.secret_key was not set. Please add the following to your Devise initializer:
  config.secret_key = 'SECRET_KEY'
```

해결방법

config/initializers/devise.rb 파일에 위의 내용을 복사해 넣기

## 2. Github 에서 fork하기

### 2.1 fork 하여 repo 생성

https://github.com/dev-study/vsns 에서 우측 상단 Fork 버튼을 눌러서 본인의 계정으로 clone

cf. https://github.com/doohee323/vsns

### 2.2 fork 한 repo를 받아 실행

```sh
$ git clone git@github.com:doohee323/vsns.git vsns
$ cd vsns/
$ bundle install
$ bundle update
```

cf. bundle install 오류 수정 참조

``` sh
$ rake db:migrate
$ rails s
http://localhost:3000
```

### 2.3 upstream branch를 dev-study/vsns.git 로부터
    추가하고 master로부터 upstream로 업데이트 받기
       
```sh
$ git remote add upstream https://github.com/dev-study/vsns.git
$ git checkout master
$ git pull upstream master
```

### 2.4 이후 다시 doohee323/vsns.git vsns 올리기

```sh
$ git push origin master
```

cf. https://docs.google.com/spreadsheet/ccc?key=0AkXtOKllIGtidGZpa3NPUDM1dHRRMDRfREJMaGFjZ1E#gid=0

## 3. Heroku에 올리기 << heroku 설치 >>

### 3.1. 계정 생성

https://dashboard.heroku.com/apps

### 3.2. 키 등록

#### 키 생성

```sh
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/id/.ssh/id_rsa): 
Created directory '/home/id/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/id/.ssh/id_rsa.
Your public key has been saved in /home/id/.ssh/id_rsa.pub.
The key fingerprint is:
00:00:00:00:00:00:00:00:00:00:00:00:00 id@ubuntu
```

####  키등록

```sh
$ heroku keys:add /home/id/.ssh/id_rsa.pub
```

#### 테스트

```sh
$ ssh -vT git@heroku.com
```

cf. 기존에 vsns가 있을 경우 삭제 필요

https://dashboard.heroku.com/apps/vsns/settings

### 3.3 앱 생성

```sh
$ heroku create vsns
$ RAILS_ENV=production rake assets:precompile
```

### 3.4 수정 흔적 남기기

```sh
$ git config --global user.email "doohee323@gmail.com"
$ git config --global user.name "Dewey Hong"

$ git status
$ git add .
$ git status
$ git commit -m "precompile" 
$ git status
```

cf. git 정보 확인

```sh
$ git remote -v
heroku  git@heroku.com:vsns.git (fetch)
heroku  git@heroku.com:vsns.git (push)
origin  https://github.com/doohee323/vsns.git (fetch)
origin  https://github.com/doohee323/vsns.git (push)

# <각각의 등록 주소는 각자 만든 heroku계정 주소 및 github에 folk해놓은 주소이다.
# 확인 후 등록이 안돼있을 경우 등록할때 참고.>
```

### 3.5 heroku 에 올리기

```sh
$ git push heroku master 
```

### 3.6 rake  db :migrate 수행

```sh
$ heroku run rake db:migrate
```

### 3.7 서비스 확인

https://dashboard.heroku.com/apps/vsns/settings

Domains : vsns.herokuapp.com

=> http://vsns.herokuapp.com/

cf. https://gist.github.com/meoooh/6506136

## <이것이야 말로 완벽 로그>

### 충돌 케이스

```sh
$ git checkout master
$ git pull origin master
$ git pull upstream master
Automatic merge failed; fix conflicts and then commit the result.
($ git mergetool)
$ git push origin master
```

### 충돌 났을 경우

```sh
$ git push origin master
To https://github.com/doohee323/vsns.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/doohee323/vsns.git'
To prevent you from losing history, non-fast-forward updates were rejected
Merge the remote changes (e.g. 'git pull') before pushing again.  See the
'Note about fast-forwards' section of 'git push --help' for details.

# 강제로 올리기
git push origin master --force        

# 변경한 내용을 모두 무시하기
git reset --hard HEAD^
```
