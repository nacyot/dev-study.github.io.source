지나가는 이야기입나다만,

김성준 님이 라이브 코딩하셨던 mansory를 적용할 때 그냥 html을
사용하셔도 됩니다. 우선은 mansory 파일을 불러온 상태에서 아래와 같이
사용하시면 됩니다.

```html
<div id="container" class="js-masonry" data-masonry-options='{ "columnWidth": 200, "itemSelector": ".item"}'>
<div class="item">...</div>
<div class="item w2">...</div>
<div class="item">...</div>
...
</div>
```

http://masonry.desandro.com/#getting-started

그냥 한 번 실행이라도 시켜보고 싶어서, 이번 미션에 users 페이지를 저런
방법으로 구현했습니다.

http://stub-lapisan.herokuapp.com/users

bootstrap javascript도 이런 식으로 된 게 많더군요. 좋은 방법인지는
모르겠는데, 간단하게 쓰기는 편리한 것 같습니다.

작정하고 쓰기엔 javascript랑 영 친하지가 못 해서 ㅜㅜ
