rails를 api 서버로 사용하면서 처음 알게된 wrap_parameters에 대해
공유합니다 -ㅁ-/

wrap_parameters는 간단하게 말해서

```json
{ "name":"group 1", "description":"description 1"}
```

이라는 parameter를

```json
{ "group":{ "name":"group 1", "description":"description 1"} }
```

으로바꿔주는 기능입니다.

rails에서는 CRUD시 객체를 가지고 작업하기 때문에 parameter를 그대로
사용하지 않고 root object로 감싸서 사용합니다.
위에서 보면 두번째 방식입니다.

그런데 client작업하는 사람 입장에서는 매번 root object(여기서는
`group`)을 입력하기 귀찮기 때문에 빼고 싶은 강렬한 욕구가 생깁니다.
이런 니즈에 의해 rails에서는 기본으로 `wrap_parameters`가 활성화되어
있습니다. (`wrap_parameter.rb` 참고)

그런데... rails-api에서는 이것이 비활성화 되어 있고 활성화 해도
정상작동하지 않습니다!! ㅠ_ㅠ

이게 작동하지 않으면 client(angularjs)쪽에서 작업할 때 매번 root
object를 입력해야 되서 좀 번거로워지는데..

다음과 같이 `wrap_parameter.rb`를 수정하여 사용하시면 됩니다.

```ruby
ActiveSupport.on_load(:action_controller) do
  include ActionController::ParamsWrapper
  wrap_parameters :format => [:json] if respond_to?(:wrap_parameters)
end
```

이것때문에 한참 삽질했네요 ㅠ

