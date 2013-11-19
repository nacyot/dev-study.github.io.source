회사에서는 맥을 쓰다가 안들고 와서 우분투로 하고 있는데 오류들이 많이
뜨네요. 혹시 ubuntu 12에서 node, npm 버전이 안맞아서 yo를 쓰지
못하시는 분들을 위해서 node 다 지우고 다시 컴파일 하는 방법을
공유합니다. (컴파일하는 것만 성공함)

## npm 삭제

```bash
sudo npm uninstall npm -g
sudo apt-get remove nodejs
rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/npm*
rm -Rf /usr/local/lib/node
```

## 0. npm compile version (ubuntu 에서는 대안)

```bash
sudo apt-get install g++ curl libssl-dev apache2-utils git-core make
automake autoconf
git clone git://github.com/joyent/node.git
sudo apt-get remove nodejs
cd node
git tag
git checkout v0.11.7
./configure
make
sudo make install
sudo ln -s /usr/local/bin/node /usr/bin/node
node -v
```
