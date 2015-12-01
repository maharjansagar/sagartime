'use strict'

angular.module 'etimesApp'
.controller 'DepartmentsCtrl', ($scope, $state, $meteor) ->
  $scope.users = $scope.$meteorCollection ()->
    Meteor.users.find {}

  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.departments = $scope.$meteorCollection ()->
    Departments.find {}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('departments')