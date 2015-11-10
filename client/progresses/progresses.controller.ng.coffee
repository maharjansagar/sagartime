'use strict'

angular.module 'etimesApp'
.controller 'ProgressesCtrl', ($scope, $meteor) ->
  $scope.viewName = 'Progresses'

  $scope.etimesheets=$scope.$meteorCollection () ->
   Etimesheets.find {}, {sort:$scope.getReactively('sort')} 
  console.log($scope.etimesheets)
  console.log($scope.etimesheets)
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('etimesheets')