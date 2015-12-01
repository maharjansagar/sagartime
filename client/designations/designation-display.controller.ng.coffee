'use strict'

angular.module 'etimesApp'
.controller 'DesignationDisplayCtrl', ($scope, $meteor, $stateParams)->
  $scope.designation = $scope.$meteorObject Designations, $stateParams.designationId
  $scope.designations = $scope.$meteorCollection () ->
    Designations.find {}

  $meteor.autorun $scope, ()->
    $scope.$meteorSubscribe('designations')

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}

  $meteor.autorun $scope, ()->
    $scope.$meteorSubscribe('users')