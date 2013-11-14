'use strict';

var devstudy = angular.module('devstudy', ['ngSanitize']);

devstudy.controller('PresentationCtrl', function ($scope, $sce) {
  // trustSrc function from http://plnkr.co/edit/tYq22VjwB10WmytQO9Pb?p=preview
  $scope.trustSrc = function(src) {
    return $sce.trustAsResourceUrl(src + "/embed");
  };
  
  $scope.changeSlide = function($event){
    $scope.src = $($event.target).attr("data-slide");
  };

  $scope.src = "http://slid.es/hanguklee/real-time-survey/embed";
});
