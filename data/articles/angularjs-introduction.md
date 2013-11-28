# AngularJS Concepts

1.Client-Side Template
2.Model View Controller(MVC) in AngularJS
3.Data Binding
4.Dependency Injection
5.Directive
6.Sample

----

## 1.Client-Side Template

```html
<html ng-app>
  <head>                                        
    <script src="angular.js"></script>                                        
    <script src="controllers.js"></script> </head>                                        
  <body>
    <div ng-controller='HelloController'>                                        
      <p>{{greeting.text}}, World</p>
    </div>
  </body>
</html>
```

```javascript
// controllers.js:                        
function HelloController($scope) { 
  $scope.greeting = { text: 'Hello' };                                
} 
```



## 2.Model View Controller(MVC) in AngularJS

* view ⇒  Document Object Model (DOM) 
* controllers ⇒  Javascript classes
* model data ⇒  stored in object properties

## 3.Data Binding

```html
<html ng-app>
  <head>                                        
    <script src="angular.js"></script>                                        
    <script src="controllers.js"></script>
  </head>                                
  <body>
    <div ng-controller='HelloController'>                                
      <input ng-model='greeting.text'>                                        
      <p>{{greeting.text}}, World</p>
    </div>                        
</body>
</html>
```

## 4.Dependency Injection
 
```javascript
function HelloController($scope, $location) { 
  $scope.greeting = { text: 'Hello' };                           
} 
```

## 5.Directives

* ng-app
* ng-controller
* ng-model
* ng-view

## 6 .Sample

```html
<html ng-app='myApp'>
  <head>                                        
    <title>Your Shopping Cart</title>
  </head>                                        
  <body ng-controller='CartController'>
    <h1>Your Order</h1>
    <div ng-repeat='item in items'>                                
      <span>{{item.title}}</span>
      <input ng-model='item.quantity'>
      <span>{{item.price | currency}}</span> 
      <span>{{item.price * item.quantity | currency}}</span> 
      <button ng-click="remove($index)">Remove</button>                                        
    </div>
    <script src="angular.js"></script> <script>                
function CartController($scope) { 
  $scope.items = [                                
    {title: 'Paint pots', quantity: 8, price: 3.95},
    {title: 'Polka dots', quantity: 17, price: 12.95},
    {title: 'Pebbles', quantity: 5, price: 6.95}                                
    ];
                                        
  $scope.remove = function(index) {
    $scope.items.splice(index, 1);                                
  }
}
    </script>                                
  </body>
</html>
```
                        
# Anatomy of an AngularJS Application 
                                                        
## 1. Invoking Angular

1. Load the angular.js library
2. ng-app directive

## 2. Loading the Script

```html
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
```
                                
## 3. Model View Controller

```html
<html ng-app>
  <body ng-controller="TextController">                                        
    <p>{{someText}}</p>                                
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"> </script>
    <script>                                
function TextController($scope) {                                        
  $scope.someText = 'You have started your journey.';
}                                
    </script>
  </body>                                
</html> 
```

```html                                
<html ng-app='myApp'>
  <body ng-controller='TextController'>                                        
  <p>{{someText.message}}</p>                                        
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
  <script>                                        
var myAppModule = angular.module('myApp', []);
myAppModule.controller('TextController', function($scope) {                                        
var someText = {};
someText.message = 'You have started your journey.';
  $scope.someText = someText;        
});
    </script>
  </body>
</html>
```

## 4. Templates and Data Binding                                                        

```html
<div ng-repeat="item in items"> 
  <span>{{item.title}}</span>                                 
</div>
```

## 5. Displaying Text                        

```html
<p>{{greeting}}</p>                                
<p ng-bind="greeting"></p>
```

## 6. Form Inputs

```html
<form ng-controller="SomeController">
  <input type="checkbox" ng-model="youCheckedIt">                                
</form> 
```

```html
<form ng-controller="StartUpController"> 
  Starting: <input ng-change="computeNeeded()" ng-model="funding.startingEstimate"> 
  Recommendation: {{funding.needed}}                        
</form> 
```                                
                        
## 7.Lists, Tables, and Other Repeated Elements 

```javascript
var students = [{name:'Mary Contrary', id:'1'}, 
                {name:'Jack Sprat', id:'2'}, 
                {name:'Jill Hill', id:'3'}];
                                        
function StudentListController($scope) { 
  $scope.students = students;                                
} 
```

```html
<ul ng-controller='StudentListController'>
<li ng-repeat='student in students'>                                
<a href='/student/view/{{student.id}}'>{{student.name}}</a> </li>                                
</ul>
```

```html
<table ng-controller=StudentListController> 
  <tr ng-repeat='track in album'>
    <td>{{$index + 1}}</td> 
    <td>{{track.name}}</td>
    <td>{{track.duration}}</td>
  </tr>
</table>
```
                
## 8. Hiding and Showing                

* ng-show  display:block
* ng-hide    display:none
        
## 9. CSS Class and Styles        

ng-class, ng-style                                                

```css
.error { 
  background-color: red;                                                
}
                                                        
.warning { 
  background-color: yellow;                                                
}
```

```html
<div ng-controller='HeaderController'> ...
<div ng-class='{error: isError, warning: isWarning}'>{{messageText}}</div> ...
<button ng-click='showError()'>Simulate Error</button>
<button ng-click='showWarning()'>Simulate Warning</button>
</div>
```

```javascript
function HeaderController($scope) { 
  $scope.isError = false; $scope.isWarning = false;
  $scope.showError = function() {
    $scope.messageText = 'This is an error!'; 
    $scope.isError = true;
    $scope.isWarning = false;                                                
  };
                                                        
  $scope.showWarning = function() {
    $scope.messageText = 'Just a warning. Please carry on.';
    $scope.isWarning = true;
    $scope.isError = false;                                                        
  }; 
}
```
                      
## 10. Considerations for src and href Attributes

ng-src, ng-href        

```html
<img ng-src="/images/cats/{{favoriteCat}}">                                 
<a ng-href="/shop/category={{numberOfBalloons}}">some text</a> 
```

## 11.Separating UI Responsibilities with Controllers 

1. 어플리케이션 모델의 초기상태 설정
2. $scope을 통해 모델과 함수들을 뷰에 노출
3. 변화에 대한 모델의 다른 부분들을 감시하고 action을 수행함                
        
* neseted controller        : childcontroller에 전달된 스콥은
parentcontroller로 전달된 스콥의 모든 속성들에 대해 접근이 가능함

```html
<div ng-controller="ParentController">
  <div ng-controller="ChildController">...</div>                                        
</div>
```
           
## 12. Observing Model Changes with $watch                                                

```javascript
$watch(watchFn, watchAction, deepWatch)
```
                                
## 13. Changing Views with Routes and $location                
                                
index.html

```html
<html ng-app="AMail">
  <head>
    <script src="src/angular.js"></script>
    <script src="src/controllers.js"></script>
  </head>
  <body>
    <h1>A-Mail</h1>
    <div ng-view></div>
  </body>
</html>
```

list.html

```html
<table>
  <tr>
    <td><strong>Sender</strong></td>
    <td><strong>Subject</strong></td> 
    <td><strong>Date</strong></td>
  </tr>
  <tr ng-repeat='message in messages'>
    <td>{{message.sender}}</td>
    <td><a href='#/view/{{message.id}}'>{{message.subject}}</td> <td>{{message.date}}</td>
  </tr>
</table>
```
                                        
detail.html

```html
<div><strong>Subject:</strong> {{message.subject}}</div> 
<div><strong>Sender:</strong> {{message.sender}}</div>
<div><strong>Date:</strong> {{message.date}}</div>
<div>
  <strong>To:</strong>
  <span ng-repeat='recipient in message.recipients'>{{recipient}} </span>
  <div>{{message.message}}</div>
  <a href='#/'>Back to message list</a> 
</div>
```

controllers.js

```javascript
// Create a module for our core AMail services                                
var aMailServices = angular.module('AMail', []);
                                        
// Set up our mappings between URLs, templates, and controllers                                
function emailRouteConfig($routeProvider) { 
  $routeProvider.
  when('/', {
    controller: ListController,                        
    templateUrl: 'list.html'
  }).
  // Notice that for the detail view, we specify a parameterized URL component
  // by placing a colon in front of the id                        
  when('/view/:id', {
    controller: DetailController,
    templateUrl: 'detail.html'                        
  }).
  otherwise({                                
    redirectTo: '/'                        
  });
} 
                                
// Set up our route so the AMail service can find it                                
aMailServices.config(emailRouteConfig);
                                
// Some fake emails                                
messages = [{
     id: 0, sender: 'jean@somecompany.com', subject: 'Hi there, old friend',
     date: 'Dec 7, 2013 12:32:00', recipients: ['greg@somecompany.com'],
     message: 'Hey, we should get together for lunch sometime and catch up.'
     +'There are many things we should collaborate on this year.'
   }, {
     id: 1, sender: 'maria@somecompany.com',
     subject: 'Where did you leave my laptop?',
     date: 'Dec 7, 2013 8:15:12', recipients: ['greg@somecompany.com'],
     message: 'I thought you were going to put it in my desk drawer.'
     +'But it does not seem to be there.'
   }, {
     id: 2, sender: 'bill@somecompany.com', subject: 'Lost python',
     date: 'Dec 6, 2013 20:35:02', recipients: ['greg@somecompany.com'],
     message: "Nobody panic, but my pet python is missing from her cage.'
     +'She doesn't move too fast, so just call me if you see her."
   },
]; 
                                
// Publish our messages for the list template                                
function ListController($scope) {
  $scope.messages = messages;
}
                                        
// Get the message id from the route (parsed from the URL) and use it to // find the right message object.
function DetailController($scope, $routeParams) {                                        
  $scope.message = messages[$routeParams.id];
}
```

## 14. Talking to Servers

```javascript
function ShoppingController($scope, $http) {
  $http.get('/products').success(function(data, status, headers, config) {                        
     $scope.items = data;
   });                                
}
```
                
```html                                        
<body ng-controller="ShoppingController"> 
  <h1>Shop!</h1>                                
    <table>
      <tr ng-repeat="item in items">                                
        <td>{{item.title}}</td> <td>{{item.description}}</td>
        <td>{{item.price | currency}}</td>
      </tr>
    </table>
    ...
```
                                
# Developing AngularJS for TDD

## 1. installation

```sh
http://yeoman.io
npm install -g yeoman 
yeoman server

npm install -g yo
npm install -g generator-angular
yo angular
grunt server
```   
                
how to create controller 

```sh
yo angular:route mycontroller                
```

## 2. Karma for TDD

```sh
# use NodeJS and SocketIO
   
sudo npm install -g karma 
karma init
karma start
karma run                 
```

## 3. Unit Tests

jasmine style

Jasmine is what we call a behavior-driven development framework.
