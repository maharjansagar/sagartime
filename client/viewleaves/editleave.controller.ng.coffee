'use strict'

angular.module 'etimesApp'
.controller 'EditleavesCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.addleave = $scope.$meteorObject Departments, $stateParams.addleaveId
  $scope.$meteorSubscribe('addleaves')